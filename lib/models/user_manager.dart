// ignore_for_file: library_prefixes

import 'package:firebase_auth/firebase_auth.dart' as FireBase;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loja_virtual_pro/helpers/firebase_errors.dart';
import 'package:loja_virtual_pro/models/user.dart' as User;

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FireBase.FirebaseAuth auth = FireBase.FirebaseAuth.instance;

  FireBase.User? user;

  bool loading = false;

  Future<void> signIn({
    required User.User user,
    required Function onFail,
    required Function onSuccess,
  }) async {
    setLoading(true);
    try {
      FireBase.UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      this.user = result.user;

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    } on FireBase.FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    setLoading(false);
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void _loadCurrentUser() {
    final FireBase.User? currentUser = auth.currentUser;
    if (currentUser != null) {
      user = currentUser;
    }
    notifyListeners();
  }
}
