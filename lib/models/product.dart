import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String? name;
  String? description;
  List<String>? images;

  Product.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.get('name');
    description = document.get('description');
    images = List<String>.from(document.get('images') as List<dynamic>);
  }
}
