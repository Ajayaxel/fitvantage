
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:my_app/auth/model/auth.dart';

import 'package:my_app/utils/auth_exceptions.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = AuthRepo();

  bool isLoading = false;
  final signInWithGoogleEither =
      Rxn<Option<Either<AppException, void>>>(none());

  signInWithGoogle() async {
    isLoading = true;
    update();
    signInWithGoogleEither.value = Some(await _authRepo.signInWithGoogle());
    isLoading = false;
    update();
  }

  signInWithApple() async {
    isLoading = true;
    update();
    signInWithGoogleEither.value = Some(await _authRepo.signInWithApple());
    isLoading = false;
    update();
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    isLoading = true;
    update();
  
    signInWithGoogleEither.value = Some(await _authRepo
        .signInWithEmailAndPassword(email: email, password: password));
    isLoading = false;
    update();
    signInWithGoogleEither.value?.fold(() {}, (e) {
      e.fold((l) {
        Get.snackbar(
          'Error',
          l.message,
        );
      }, (r) {
      // bootmnav navigtion  Get.offAll(const ());
      });
    });
  }

  signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    isLoading = true;
    update();
    signInWithGoogleEither.value = Some(
        await _authRepo.registerWithEmailAndPassword(
            email: email, password: password, name: name));
    isLoading = false;
    update();
    signInWithGoogleEither.value?.fold(() {}, (e) {
      e.fold((l) {
        Get.snackbar(
          'Error',
          l.message,
        );
      }, (r) {
       // Get.offAll(const BottmNav());
      });
    });
  }

  signOut() async {
    isLoading = true;
    update();
    await _authRepo.signOut();
    isLoading = false;
    update();
  }
}
