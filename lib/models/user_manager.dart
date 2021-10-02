import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loja_virtual_pro/helpers/firebase_errors.dart';
// ignore: library_prefixes
import 'package:loja_virtual_pro/models/user.dart' as User;

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  Future<void> signIn(
      {User.User? user, Function? onFail, Function? onSuccess}) async {
    setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(
          email: user!.email, password: user.password);

      onSuccess!();
    } on PlatformException catch (e) {
      onFail!(getErrorString(e.code));
    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
    setLoading(false);
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
