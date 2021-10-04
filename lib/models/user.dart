import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  String? name;
  String? email;
  String? password;

  String? confirmedPassword;

  User({this.email, this.password, this.id});
  User.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.get('name');
    email = document.get('email');
  }

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
