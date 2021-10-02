import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
// ignore: library_prefixes
import 'package:loja_virtual_pro/models/user.dart' as User;

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(User.User user) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      print(result.user!.uid);
    } catch (e) {
      print(e);
    }
  }
}
