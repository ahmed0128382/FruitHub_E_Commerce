import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete().then((value) {
      log('User deleted successfully');
    }).catchError((error) {
      log('Error deleting user: $error');
    });
  }

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

      //

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

  // Future<User> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignIn googleSignIn = GoogleSignIn.standard(
  //     scopes: [
  //       'email',
  //       // 'https://www.googleapis.com/auth/userinfo.profile',
  //     ],
  //   );

  //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   final user =
  //       (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  //   if (user == null) {
  //     throw FirebaseAuthException(
  //       code: 'USER_NULL',
  //       message: 'Google Sign-In failed. User object is null.',
  //     );
  //   }
  //   return user;
  // }
  // Future<User> signInWithGoogle() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn.standard(
  //     scopes: [
  //       'email',
  //       // 'https://www.googleapis.com/auth/userinfo.profile',
  //     ],
  //   );

  //   // Disconnect previous session to avoid silent sign-in
  //   await googleSignIn.disconnect();
  //   await googleSignIn.signOut();

  //   // Trigger the account selection flow
  //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  //   if (googleUser == null) {
  //     throw FirebaseAuthException(
  //       code: 'SIGN_IN_ABORTED',
  //       message: 'User aborted Google Sign-In.',
  //     );
  //   }

  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   final UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   final User? user = userCredential.user;

  //   if (user == null) {
  //     throw FirebaseAuthException(
  //       code: 'USER_NULL',
  //       message: 'Google Sign-In failed. User object is null.',
  //     );
  //   }

  //   return user;
  // }
  Future<User> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.standard(
      scopes: [
        'email',
        // 'https://www.googleapis.com/auth/userinfo.profile',
      ],
    );

    // ✅ Only disconnect if already signed in
    final isSignedIn = await googleSignIn.isSignedIn();
    if (isSignedIn) {
      try {
        await googleSignIn.disconnect();
        await googleSignIn.signOut();
      } catch (e) {
        log('Safe disconnect failed: $e');
      }
    }

    // Start sign-in process
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'SIGN_IN_ABORTED',
        message: 'User aborted Google Sign-In.',
      );
    }

    final String email = googleUser.email;

    // Check sign-in methods for this email
    final List<String> signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in or register
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final User? user = userCredential.user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'USER_NULL',
        message: 'Google Sign-In failed. User object is null.',
      );
    }

    return user;
  }

  Future<User?> signInWithFacebook() async {
    try {
      // Trigger the Facebook login flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success ||
          loginResult.accessToken == null) {
        throw FirebaseAuthException(
          code: 'ERROR_FACEBOOK_LOGIN_FAILED',
          message: 'Facebook login failed or was cancelled.',
        );
      }

      // Build Facebook credential
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Attempt sign-in with Facebook
      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        //final String? email = e.email;
        final AuthCredential? pendingCred = e.credential;

        // Let user sign in with existing provider (Google, for example)
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        if (googleUser == null) {
          throw FirebaseAuthException(
            code: 'ERROR_GOOGLE_SIGN_IN_CANCELLED',
            message: 'Google sign-in was cancelled.',
          );
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential googleUserCred =
            await FirebaseAuth.instance.signInWithCredential(googleCredential);

        // Link the pending Facebook credential
        await googleUserCred.user?.linkWithCredential(pendingCred!);
        return googleUserCred.user;
      }

      // Re-throw other errors
      rethrow;
    }
  }

  bool isSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
