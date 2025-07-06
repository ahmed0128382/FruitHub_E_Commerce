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
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضغيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
            message: 'لقد قمت بالتسجيل مسبقا ! بالرجاء المحاولة مرة أخري');
      } else {
        throw CustomExceptions(
            message: 'لقد حدث خطأ ما! بالرجاء المحاولة مرة أخري');
      }
    } catch (e) {
      throw CustomExceptions(
          message: 'لقد حدث خطأ ما! بالرجاء المحاولة مرة أخري');
    }
  }
}
