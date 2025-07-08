import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure(message: '!خطأ غير متوقع'));
    }
    //throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure(message: '!خطأ غير متوقع'));
    }
  }

  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}',
      );
      return left(ServerFailure(message: '!خطأ غير متوقع'));
    }
  }
}
