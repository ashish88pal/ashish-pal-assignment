import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vt/app/widgets/custom_snackbar.dart';

import '../../../../utils.dart';
import '../../../services/firestore_services.dart';
import '../../../data/user_model.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passowordFocus = FocusNode();

  final signupFormKey = GlobalKey<FormState>();
  var isPassHidden = true.obs;

  signup() {
    if (signupFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      Get.showOverlay(
        asyncFunction: () async {
          try {
            var authResult = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: email.value.text.trim(),
                    password: password.value.text.trim());
            final fcmToken = await FirebaseMessaging.instance.getToken();

            FireStoreService.createUser(UserModel(
                id: authResult.user!.uid,
                email: email.value.text.trim(),
                name: name.value.text.trim(),
                fcmToken: fcmToken ?? ""));

            if (authResult.user != null) {
              successSnackbar('User Registered Successfully');

              Get.offNamedUntil(Routes.HOME, (route) => false);
            }
          } catch (e) {
            errorSnackbar('Something went wrong');

            if (e is PlatformException) return e.message;
            return e.toString();
          }
        },
        loadingWidget: Center(
          child: LoadingAnimationWidget.threeRotatingDots(
              color: themeColor, size: Get.width / 3),
        ),
      );
    }
  }
}
