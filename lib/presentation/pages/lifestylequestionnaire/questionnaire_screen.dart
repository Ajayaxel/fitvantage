import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/lifestyle/lifestyle_bloc.dart';
import 'package:my_app/bloc/lifestyle/lifestyle_state.dart';
import 'package:my_app/models/health_assessment_models.dart';


class LifestyleQuestionPage extends StatefulWidget {
  const LifestyleQuestionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LifestyleQuestionPageState createState() => _LifestyleQuestionPageState();
}

class _LifestyleQuestionPageState extends State<LifestyleQuestionPage> {
  static Color fbcolor = const Color(0xff7FFA88);
  int currentCategoryIndex = 0;
  int currentQuestionIndex = 0;
  Map<String, UserResponse> userResponses = {};
  double totalScore = 0.0;

  void nextQuestion(List<Category> categories) {
    final questions = categories[currentCategoryIndex].questions;
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else if (currentCategoryIndex < categories.length - 1) {
      setState(() {
        currentCategoryIndex++;
        currentQuestionIndex = 0;
      });
    } else {
      calculateScore(categories);
    }
  }

  void calculateScore(List<Category> categories) {
    double score = 0.0;
    for (var response in userResponses.values) {
      score += response.score;
    }
    setState(() {
      totalScore = score;
    });
    submitResponses();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text("Assessment Completed", style: TextStyle(color: fbcolor)),
        content: Text("Total Score: ${score.toStringAsFixed(1)}",
            style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: TextStyle(color: fbcolor)),
          )
        ],
      ),
    );
  }

  void submitResponses() {}

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    } else if (currentCategoryIndex > 0) {
      setState(() {
        currentCategoryIndex--;
        currentQuestionIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LifestyleBloc, LifestyleState>(
        builder: (context, state) {
          if (state is LifestyleLoading) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.green));
          } else if (state is LifestyleLoaded) {
            final categories = state.categories;
            final totalQuestions = categories.fold<int>(
                0, (sum, cat) => sum + cat.questions.length);
            final answeredQuestions = categories
                    .sublist(0, currentCategoryIndex)
                    .fold<int>(0, (sum, cat) => sum + cat.questions.length) +
                currentQuestionIndex +
                1;

            final category = categories[currentCategoryIndex];
            final question = category.questions[currentQuestionIndex];

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        category.categoryName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // The updated box cloned from your design
                    Container(
                      height: 118,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff161816),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 16, right: 70),
                            child: Stack(
                              children: [
                                Container(
                                  height: 8,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    double percent =
                                        answeredQuestions / totalQuestions;
                                    return Container(
                                      height: 8,
                                      width: constraints.maxWidth * percent,
                                      decoration: BoxDecoration(
                                        color: fbcolor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 16,
                            child: Text(
                              "$answeredQuestions/$totalQuestions",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text(
                                question.questionName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Options List
                    Expanded(
                      child: ListView.builder(
                        itemCount: question.options.length,
                        itemBuilder: (context, index) {
                          final option = question.options[index];
                          final isSelected = userResponses[question.questionId]
                                  ?.selectedOptionId ==
                              option.optionId;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                userResponses[question.questionId] =
                                    UserResponse(
                                  questionId: question.questionId,
                                  selectedOptionId: option.optionId,
                                  score: option.score,
                                );
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xff5E615F)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: isSelected
                                      ? fbcolor
                                      : const Color(0xff5E615F),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: isSelected
                                              ? fbcolor
                                              : Colors.white),
                                    ),
                                    child: isSelected
                                        ? Center(
                                            child: Icon(Icons.check,
                                                color: fbcolor, size: 16),
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      option.optionName,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentQuestionIndex > 0 ||
                            currentCategoryIndex > 0)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: fbcolor),
                              ),
                            ),
                            onPressed: previousQuestion,
                            child: Text("Previous",
                                style: TextStyle(color: fbcolor)),
                          ),
                        GestureDetector(
                          onTap: () => nextQuestion(state.categories),
                          child: Container(
                          
                            padding: const EdgeInsets.symmetric(horizontal: 40 ,vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff7FFA88),
                                  Color(0xff36813C),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                (currentCategoryIndex ==
                                            state.categories.length - 1 &&
                                        currentQuestionIndex ==
                                            state
                                                    .categories[
                                                        currentCategoryIndex]
                                                    .questions
                                                    .length -
                                                1)
                                    ? "Submit"
                                    : "Next",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is LifestyleError) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: Colors.red)));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
