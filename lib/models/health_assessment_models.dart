import 'dart:convert';

class HealthAssessmentResponse {
  final int code;
  final String message;
  final List<Category> data;

  HealthAssessmentResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory HealthAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return HealthAssessmentResponse(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => Category.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.map((category) => category.toJson()).toList(),
    };
  }
}

class Category {
  final String categoryId;
  final String categoryName;
  final String categoryDescription;
  final List<Question> questions;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
    required this.questions,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'] ?? '',
      categoryName: json['category_name'] ?? '',
      categoryDescription: json['category_description'] ?? '',
      questions: (json['questions'] as List<dynamic>?)
              ?.map((item) => Question.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'category_description': categoryDescription,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

class Question {
  final String questionId;
  final String questionName;
  final String? questionDescription;
  final List<Option> options;

  Question({
    required this.questionId,
    required this.questionName,
    this.questionDescription,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['question_id'] ?? '',
      questionName: json['question_name'] ?? '',
      questionDescription: json['question_description'],
      options: (json['options'] as List<dynamic>?)
              ?.map((item) => Option.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'question_name': questionName,
      'question_description': questionDescription,
      'options': options.map((o) => o.toJson()).toList(),
    };
  }
}

class Option {
  final String optionId;
  final String optionName;
  final String? optionDescription;
  final double score;

  Option({
    required this.optionId,
    required this.optionName,
    this.optionDescription,
    required this.score,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      optionId: json['option_id'] ?? '',
      optionName: json['option_name'] ?? '',
      optionDescription: json['option_description'],
      score: double.tryParse(json['score'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option_id': optionId,
      'option_name': optionName,
      'option_description': optionDescription,
      'score': score.toString(),
    };
  }
}

// User response model
class UserResponse {
  final String questionId;
  final String selectedOptionId;
  final double score;

  UserResponse({
    required this.questionId,
    required this.selectedOptionId,
    required this.score,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      questionId: json['question_id'] ?? '',
      selectedOptionId: json['selected_option_id'] ?? '',
      score: double.tryParse(json['score'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'selected_option_id': selectedOptionId,
      'score': score,
    };
  }
}

// Category-level score model
class CategoryScore {
  final String categoryId;
  final String categoryName;
  final double totalScore;
  final double maxPossibleScore;
  final double percentage;
  final List<UserResponse> responses;

  CategoryScore({
    required this.categoryId,
    required this.categoryName,
    required this.totalScore,
    required this.maxPossibleScore,
    required this.percentage,
    required this.responses,
  });

  factory CategoryScore.fromJson(Map<String, dynamic> json) {
    return CategoryScore(
      categoryId: json['category_id'] ?? '',
      categoryName: json['category_name'] ?? '',
      totalScore: double.tryParse(json['total_score'].toString()) ?? 0.0,
      maxPossibleScore:
          double.tryParse(json['max_possible_score'].toString()) ?? 0.0,
      percentage: double.tryParse(json['percentage'].toString()) ?? 0.0,
      responses: (json['responses'] as List<dynamic>?)
              ?.map((item) => UserResponse.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'total_score': totalScore,
      'max_possible_score': maxPossibleScore,
      'percentage': percentage,
      'responses': responses.map((r) => r.toJson()).toList(),
    };
  }
}

extension CategoryExtensions on Category {
  double get maxPossibleScore {
    return questions.fold(0.0, (sum, q) {
      if (q.options.isEmpty) return sum;
      double max = q.options.map((o) => o.score).reduce((a, b) => a > b ? a : b);
      return sum + max;
    });
  }

  double get minPossibleScore {
    return questions.fold(0.0, (sum, q) {
      if (q.options.isEmpty) return sum;
      double min = q.options.map((o) => o.score).reduce((a, b) => a < b ? a : b);
      return sum + min;
    });
  }
}

extension QuestionExtensions on Question {
  Option? get highestScoredOption {
    if (options.isEmpty) return null;
    return options.reduce((a, b) => a.score > b.score ? a : b);
  }

  Option? get lowestScoredOption {
    if (options.isEmpty) return null;
    return options.reduce((a, b) => a.score < b.score ? a : b);
  }
}

class HealthAssessmentHelper {
  static HealthAssessmentResponse parseResponse(String jsonString) {
    final json = jsonDecode(jsonString);
    return HealthAssessmentResponse.fromJson(json);
  }

  static CategoryScore calculateCategoryScore(
      Category category, List<UserResponse> userResponses) {
    double totalScore = 0.0;
    List<UserResponse> matchedResponses = [];

    for (var question in category.questions) {
      var response = userResponses.firstWhere(
        (r) => r.questionId == question.questionId,
        orElse: () => UserResponse(
          questionId: question.questionId,
          selectedOptionId: '',
          score: 0.0,
        ),
      );

      if (response.selectedOptionId.isNotEmpty) {
        totalScore += response.score;
        matchedResponses.add(response);
      }
    }

    double max = category.maxPossibleScore;
    double percent = max > 0 ? (totalScore / max) * 100 : 0;

    return CategoryScore(
      categoryId: category.categoryId,
      categoryName: category.categoryName,
      totalScore: totalScore,
      maxPossibleScore: max,
      percentage: percent,
      responses: matchedResponses,
    );
  }

  static Map<String, dynamic> calculateOverallScore(
      List<CategoryScore> scores) {
    double total = scores.fold(0.0, (sum, s) => sum + s.totalScore);
    double max = scores.fold(0.0, (sum, s) => sum + s.maxPossibleScore);
    double percent = max > 0 ? (total / max) * 100 : 0;

    return {
      'total_score': total,
      'max_possible_score': max,
      'overall_percentage': percent,
      'category_scores': scores,
    };
  }
}


