import 'package:dartz/dartz.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/auth/model/auth.dart';
import 'package:my_app/utils/auth_exceptions.dart';

class AuthController extends GetxController{
  final AuthRepo _authRepo = AuthRepo();
  
  bool isLoading =false;
   final signInWithGoogleEither = Rxn<Option<Either<AppException, void>>>(none());




signInWithGoogle()async{
  isLoading = true;
  update();
   signInWithGoogleEither.value =  Some( await _authRepo.signInWithGoogle()) ;
   isLoading =false;
   update();
}

signInWithApple()async{
  isLoading = true;
  update();
   signInWithGoogleEither.value =  Some( await _authRepo.signInWithApple()) ;
   isLoading =false;
   update();
}

}