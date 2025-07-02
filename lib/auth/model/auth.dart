import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/auth/model/database.dart';
import 'package:my_app/utils/auth_exceptions.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

  Future<Either<AppException,User?>> signInWithEmailAndPassword({required String password, required String email}) async {


     try {
      log('Api call sign in with email and password---->');
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      
      return Right(result.user) ;
    }  catch (e) {
      log('Login Error: $e');
      return Left(ExceptionFilter.filterException(e));
    }

   
   
  }

  Future<Either<AppException,User?>> registerWithEmailAndPassword({required String password, required String email,required String name}) async {


     try {
      log('Api call sign in with email and password---->');
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

       await result.user?.updateDisplayName(name);
 await _firestore.collection('users').doc(result.user!.uid).set({
        'uid': result.user!.uid,
        'email': email,
        'userName': name,
        'createdAt': FieldValue.serverTimestamp(),
      });

    
      
      return Right(result.user) ;
    }  catch (e) {
      log('Login Error: $e');
      return Left(ExceptionFilter.filterException(e));
    }

   
   
  }


  Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
}