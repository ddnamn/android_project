import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/Constants/constants.dart';
import 'package:project/Models/userModel.dart';

class Database {
  static void updateUserData(UserModel user) {
    usersRef.doc(user.id).update({
      'name': user.name,
      'umur': user.umur,
      'quotes': user.quotes,
    });
  }
}
