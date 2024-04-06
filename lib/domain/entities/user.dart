import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String name;
  final String password;

  User({this.id, required this.name, required this.password});

  static User? fromDocument(QuerySnapshot<Map<String, dynamic>> documents) {
    if (documents.size == 0) return null;

    QueryDocumentSnapshot<Map<String, dynamic>> document = documents.docs[0];

    return User(id: document.id, name: document['name'], password: document['password']);
  }

  factory User.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);

    return User(name: map['name'], password: map['password']);
  }
}
