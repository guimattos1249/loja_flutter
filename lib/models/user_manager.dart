// ignore_for_file: library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User.User? user;

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

      await _loadCurrentUser(firebaseUser: result.user);

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    } on FireBase.FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    setLoading(false);
  }

  Future<void> signUp({
    required User.User user,
    required Function onFail,
    required Function onSuccess,
  }) async {
    setLoading(true);

    try {
      FireBase.UserCredential result =
          await auth.createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      user.id = result.user!.uid;
      this.user = user;

      await user.saveData();

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

  Future<void> _loadCurrentUser({FireBase.User? firebaseUser}) async {
    final FireBase.User? currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').doc(currentUser.uid).get();
      user = User.User.fromDocument(docUser);
      notifyListeners();
    }
  }
}
