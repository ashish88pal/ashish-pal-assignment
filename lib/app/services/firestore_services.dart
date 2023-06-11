import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../data/user_model.dart';

class FireStoreService {
  static final FireStoreService _singleton = FireStoreService._internal();
  FireStoreService._internal();
  static FireStoreService get instance => _singleton;

  static final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  static Future createUser(UserModel user) async {
    try {
      userCollectionRef.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  static Future updateUserFCM(
    String userId,
    String token,
  ) async {
    try {
      userCollectionRef.doc(userId).update(
        {"fcmToken": token},
      );
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  static Future getUser(String uid) async {
    try {
      var userData = await userCollectionRef.doc(uid).get();
      userData.data();
      return UserModel.fromMap(userData.data() as Map<String, dynamic>);
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  static Future getAllUsersOnce() async {
    var userDocSnap = await userCollectionRef.get();
    if (userDocSnap.docs.isNotEmpty) {
      return userDocSnap.docs
          .map((user) => UserModel.fromMap(user.data() as Map<String, dynamic>))
          .toList();
    }
  }
}
