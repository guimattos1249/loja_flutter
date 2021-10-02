import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual_pro/helpers/firebase_errors.dart';
// ignore: library_prefixes
import 'package:loja_virtual_pro/models/user.dart' as User;

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(
      {User.User? user, Function? onFail, Function? onSuccess}) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: user!.email, password: user.password);

      onSuccess!();
    } on PlatformException catch (e) {
      onFail!(getErrorString(e.code));
    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
  }
}
