import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String umur;
  String quotes;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.umur,
    required this.quotes,
  });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      name: doc['name'],
      email: doc['email'],
      umur: doc['umur'],
      quotes: doc['quotes'],
    );
  }
}
