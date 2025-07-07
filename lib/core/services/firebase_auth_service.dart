import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضغيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
            message: 'لقد قمت بالتسجيل مسبقا ! بالرجاء المحاولة مرة أخري');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'تأكد من اتصالك بالإنترنت');
      } else {
        throw CustomExceptions(
            message: 'لقد حدث خطأ ما! بالرجاء المحاولة مرة أخري');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}',
      );

      throw CustomExceptions(
          message: 'لقد حدث خطأ ما! بالرجاء المحاولة مرة أخري');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomExceptions(
            message: 'كلمة المرور أو البريد الإلكتروني غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'تأكد من اتصالك بالإنترنت');
      } else {
        throw CustomExceptions(
            message: 'لقد حدث خطأ ما! بالرجاء المحاولة مرة أخري');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );

      throw CustomExceptions(
          message: 'لقد حدث خطأ ما! بالرجاء المحاولة مرة أخري');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signOut : ${e.toString()}',
      );
      throw CustomExceptions(
          message: 'لقد حدث خطأ ما! بالرجاء المحاولة مرة أخري');
    }
  }
}
