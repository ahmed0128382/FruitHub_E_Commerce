import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) {
    throw UnimplementedError();
  }
}
