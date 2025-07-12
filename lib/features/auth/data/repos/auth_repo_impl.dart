import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/data_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, password: password);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure(message: '!خطأ غير متوقع'));
    }
    //throw UnimplementedError();
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(userId: user.email!);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure(message: '!خطأ غير متوقع'));
    }
  }

  @override
  // Future<Either<Failure, UserEntity>> signInWithGoogle() async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.signInWithGoogle();
  //     UserEntity userEntity;
  //     userEntity = UserModel.fromFirebaseUser(user);
  //     //FirestoreService.userId += 1;
  //     // await addUserData(user: userEntity);
  //     var isUserExists = await databaseService.checkIfDataExists(
  //       path: BackendEndpoints.userDataPath,
  //       docId: user.email!, // Using email as a unique identifier
  //     );
  //     if (isUserExists) {
  //       await getUserData(userId: user.email!);
  //     } else {
  //       await addUserData(user: userEntity);
  //     }

  //     return right(userEntity);
  //   } catch (e) {
  //     await deleteUser(user);
  //     log(
  //       'Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}',
  //     );
  //     return left(ServerFailure(message: '!خطأ غير متوقع'));
  //   }
  // }
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      if (user == null) {
        return left(ServerFailure(message: '!تعذر تسجيل الدخول إلى Google'));
      }

      final userEntity = UserModel.fromFirebaseUser(user);

      final isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.userDataPath,
        docId: user.email!,
      );

      if (isUserExists) {
        await getUserData(userId: user.email!);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: $e');

      // Attempt safe cleanup if needed
      try {
        final googleSignIn = GoogleSignIn();
        if (await googleSignIn.isSignedIn()) {
          await googleSignIn.disconnect();
          await googleSignIn.signOut();
        }
      } catch (disconnectError) {
        log('GoogleSignIn disconnect/signOut error: $disconnectError');
      }

      try {
        if (user != null) {
          await user.delete(); // only if recently signed in
        }
      } catch (deleteError) {
        log('Firebase user delete error: $deleteError');
      }

      return left(ServerFailure(message: '!حدث خطأ أثناء تسجيل الدخول'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user!);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.signInWithFacebook : ${e.toString()}',
      );
      return left(ServerFailure(message: '!خطأ غير متوقع'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    //FirestoreService.userId += 1; // Increment userId for each new user
    await databaseService.addData(
      path: BackendEndpoints.userDataPath,
      data: user.tomap(),
      docId: user.email, // Using email as a unique identifier
    );
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoints.userDataPath, docId: userId);
    return UserModel.fromJson(userData);
  }
}
