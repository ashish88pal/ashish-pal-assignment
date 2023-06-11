import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vt/app/widgets/custom_snackbar.dart';

import '../../../../utils.dart';
import '../../../services/firestore_services.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passowordFocus = FocusNode();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  var isPassHidden = true.obs;





  login(){
     if (loginFormKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                         Get.showOverlay(
                          asyncFunction: () async {
                               try {
      var authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.value.text.trim(), password: password.value.text.trim());

      if (authResult.user != null) {
        final fcmToken = await FirebaseMessaging.instance.getToken();
        await FireStoreService.updateUserFCM(
            FirebaseAuth.instance.currentUser!.uid, fcmToken ?? "");

        successSnackbar('User LoggedIn Successfully');

        Get.offNamedUntil(Routes.HOME, (route) => false);
      }

    } catch (e) {
      errorSnackbar('Something went wrong');
      if (e is PlatformException) return e.message;
      return e.toString();
    }
                        },
                          loadingWidget:  Center(
                            child:  LoadingAnimationWidget.threeRotatingDots(color: themeColor, size: Get.width/3),
                          ),
                        );
                      }
  }


}
