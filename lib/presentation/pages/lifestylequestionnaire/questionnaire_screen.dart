import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_state.dart';
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

  void submitResponses() {
    // 🚀 Call your score submission API here
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<LifestyleBloc, LifestyleState>(
          builder: (context, state) {
            if (state is LifestyleLoading) {
              return const Center(child: CircularProgressIndicator(
                backgroundColor: Colors.green,
                color: Colors.green));
            } else if (state is LifestyleLoaded) {
              final category = state.categories[currentCategoryIndex];
              final question = category.questions[currentQuestionIndex];

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                    Center(
                      child: Text(
                        category.categoryName,
                        style: TextStyle(
                          color: fbcolor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        question.questionName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...question.options.map(
                      (option) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: userResponses[question.questionId]?.selectedOptionId == option.optionId
                                ? fbcolor
                                : Colors.grey.shade800,
                            width: 1.5,
                          ),
                        ),
                        child: RadioListTile<String>(
                          activeColor: Colors.greenAccent,
                          title: Text(
                            option.optionName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: option.optionId,
                          groupValue: userResponses[question.questionId]?.selectedOptionId,
                          onChanged: (value) {
                            setState(() {
                              userResponses[question.questionId] = UserResponse(
                                questionId: question.questionId,
                                selectedOptionId: value!,
                                score: option.score,
                              );
                            });
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentQuestionIndex > 0 || currentCategoryIndex > 0)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: fbcolor,
                            ),
                            onPressed: previousQuestion,
                            child: const Text("Previous"),
                          ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: fbcolor,
                          ),
                          onPressed: () => nextQuestion(state.categories),
                          child: Text(
                            (currentCategoryIndex == state.categories.length - 1 &&
                                    currentQuestionIndex == state.categories[currentCategoryIndex].questions.length - 1)
                                ? "Submit"
                                : "Next",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is LifestyleError) {
              return Center(
                child: Text(state.message, style: const TextStyle(color: Colors.red)),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

