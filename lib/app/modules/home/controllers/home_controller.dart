import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vt/app/widgets/custom_snackbar.dart';
import 'package:vt/app/services/firestore_services.dart';

import '../../../../utils.dart';
import '../../../data/user_model.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  RxBool isloading = true.obs;
  RxString name = "".obs;

  List<UserModel> userList = [];

  var isPassHidden = true.obs;

  loadUsers() async {
    await FireStoreService.getAllUsersOnce().then((v) {
      userList = v;
      isloading.value = false;

      name.value = userList
          .firstWhere(
              (element) => element.id == FirebaseAuth.instance.currentUser?.uid)
          .name;
    });
  }

  logout() {
    Get.showOverlay(
        asyncFunction: () async {
          await FirebaseMessaging.instance.deleteToken();
          await FirebaseAuth.instance.signOut();
          Get.offNamedUntil(Routes.LOGIN, (route) => false);
        },
        loadingWidget:  Center(child:  LoadingAnimationWidget.threeRotatingDots(color: themeColor, size: Get.width/3)));
    successSnackbar("User logged out");
  }

  Future<void> sendNotification(token) async {
    final data = {
      "notification": {
        "body": "Test sg data hehe hehe hehe ... ",
        "title": "Test Msg"
      },
      "priority": "high",

      "to": "$token"
    };

    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 3000),
      headers: {
        'content-type': 'application/json',
        'Authorization':
            'key=AAAAL7cVm4g:APA91bHLGQfu8WkQs8gW_3ivK0oLcLFCB0y2xzoATn_2b5KUFqGPWYA74PkqRc2pbkcSOer6crIC6RQRRN31AhjCNCqHQxOzste9lyLpihDBNVujB-cwYD0LlliCXNBMgYdn2DwOdHEd'
      },
    );

    try {
      final response = await Dio(options)
          .post("https://fcm.googleapis.com/fcm/send", data: data);

      if (response.statusCode == 200) {
         successSnackbar("notification sent");
      } else {
        errorSnackbar("notification sending failed");


      }
    } catch (e) {
 errorSnackbar("Something went wrong");

    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }
}
