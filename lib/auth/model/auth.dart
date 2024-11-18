import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/auth/model/database.dart';
import 'package:my_app/utils/auth_exceptions.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

 User ? getCurrentUser()  {
    return  auth.currentUser;
  }

  Future<Either<AppException,void>> signInWithGoogle() async {
   
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try{

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result = await auth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (userDetails != null) {
      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL,
        "id": userDetails.uid,
      };
    await  DatabaseMethods().addUser(userDetails.uid, userInfoMap);
    }
  
    return const Right(null);

   
    }
     on FirebaseAuthException catch(e){
       log('Errror auth ->$e');
     return Left(filterExceptions(e));

    }
    catch (e){
      log('Errror ->$e');
return Left(AppException('somthing went wrong'));
    }
  }

  Future<Either<AppException,void>> signInWithApple({List<Scope> scopes = const []}) async {

    try{
       final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);

    switch (result.status) {
      case AuthorizationStatus.authorized:
        final AppleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
            idToken: String.fromCharCodes(AppleIdCredential.identityToken!));
        final UserCredential = await auth.signInWithCredential(credential);
        final firebaseUser = UserCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = AppleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        return const Right(null);
      case AuthorizationStatus.error:
         return Left(UndefinedAuthException());

      case AuthorizationStatus.cancelled:
          return Left(UndefinedAuthException());

      default:
        return Left(UndefinedAuthException());
    }
    }
    catch(e){
 return Left(OperationNotAllowedException());
    }
   
  }
}