

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:my_app/lifestylequestiner/model/lifestylequestionnairemodel.dart'
    as model;
import 'package:my_app/lifestylequestiner/model/questionair_repo.dart';
import 'package:my_app/utils/auth_exceptions.dart';

class LifeStyleQuestionairController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    getLifeStyleQuestions();
    super.onInit();
  }

  final QuestionairRepo _questionairRepo = QuestionairRepo();
  bool isLoading = false;
  Option<Either<AppException, model.LifeStyleQustionairModel>>
      lifeStyleQuestionairData = none();
  int categoryI = 0;
  int questionI = 0;
  int selectedOptionindex = -1;

  void getLifeStyleQuestions() async {
    isLoading = true;
    update();
    lifeStyleQuestionairData = Some(await _questionairRepo.getQuestionair());
    isLoading = false;
    update();
  }

  model.LifeStyleQustionairModel? getModelData() {
    return lifeStyleQuestionairData.fold(() {
      return null;
    }, (e) {
      return e.fold((e) {
        return null;
      }, (d) {
        return d;
      });
    });
  }

  bool categoryIsEmpty() {
    final data = getModelData();
    if (data != null) {
      if (data.data.isNotEmpty && data.data.first.questions.isNotEmpty) {
        return false;
      }
    }
    return true;
  }

  showNextQuestion() {
    final data = getModelData();
    if (data != null) {
      if (data.data[categoryI].questions.length - 1 > questionI) {
        questionI++;
      } else {
        if (data.data.length - 1 > categoryI) {
          categoryI++;
          questionI = 0;
        }
      }
    }

    selectedOptionindex = -1;
    update();
  }

  //  showPreviousQuestion(){
  //   final data = getModelData();
  //   if (data != null) {
  //     if (0> questionI) {
  //       questionI--;
  //     } else {
  //       if (0> categoryI) {
  //         categoryI--;
  //         questionI = 0;
  //       }
  //     }
  //   }

  //   selectedOptionindex = -1;
  //   update();
  // }
   showPreviousQuestion() {
  final data = getModelData();
  if (data != null) {
    // If we're not at the first question of the current category, go back one question.
    if (questionI > 0) {
      questionI--;
    } else {
      // If we are at the first question of the current category but there is a previous category, move to the previous category.
      if (categoryI > 0) {
        categoryI--;
        // Set questionI to the last question of the new category.
        questionI = data.data[categoryI].questions.length - 1;
      }
    }
    update(); // This will refresh the UI with the updated question index.
  }
}

  bool isLastQuestion() {
    final data = getModelData();

    return (data != null &&
        data.data.length - 1 == categoryI &&
        data.data[categoryI].questions.length - 1 == questionI);
  }

    bool isFirstQuestion() {
    final data = getModelData();

    return (data != null &&
        data.data.length - 1 == categoryI &&
        data.data[categoryI].questions.length - 1 == questionI);
  }

  selectOption(int index) {
    selectedOptionindex = index;
    update();
  }
}
