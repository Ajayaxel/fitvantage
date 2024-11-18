
import 'dart:convert';


LifeStyleQustionairModel lifeStyleQustionairFromJson(String str) => LifeStyleQustionairModel.fromJson(json.decode(str));

String lifeStyleQustionairToJson(LifeStyleQustionairModel data) => json.encode(data.toJson());

class LifeStyleQustionairModel {
    int? code;
    String? message;
    List<Category> data;

    LifeStyleQustionairModel({
        this.code,
        this.message,
       required this.data,
    });

    factory LifeStyleQustionairModel.fromJson(Map<String, dynamic> json) => LifeStyleQustionairModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Category>.from(json["data"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Category {
    int? categoryId;
    String? categoryName;
    String? categoryDescription;
    List<Question> questions;

    Category({
        this.categoryId,
        this.categoryName,
        this.categoryDescription,
       required this.questions,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryDescription: json["category_description"],
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_description": categoryDescription,
        "questions": questions == null ? [] : List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class Question {
    int? questionId;
    String? questionName;
    String? questionDescription;
    List<Option> options;

    Question({
        this.questionId,
        this.questionName,
        this.questionDescription,
       required this.options,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionId: json["question_id"],
        questionName: json["question_name"],
        questionDescription: json["question_description"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "question_name": questionName,
        "question_description": questionDescription,
        "options": options == null ? [] : List<dynamic>.from(options.map((x) => x.toJson())),
    };
}

class Option {
    int? optionId;
    String? optionName;
    dynamic optionDescription;
    int? score;

    Option({
        this.optionId,
        this.optionName,
        this.optionDescription,
        this.score,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionId: json["option_id"],
        optionName: json["option_name"],
        optionDescription: json["option_description"],
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "option_id": optionId,
        "option_name": optionName,
        "option_description": optionDescription,
        "score": score,
    };
}
