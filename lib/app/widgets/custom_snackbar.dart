import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';
import 'custom_buttton.dart';

SnackbarController? errorSnackbar(String msg,
    {VoidCallback? onTap, String? btnText}) {
  if (!Get.isSnackbarOpen) {
    return Get.rawSnackbar(
        messageText: Text(
          msg.capitalize.toString(),
          style: const TextStyle(
            color: errorColor,
            shadows: [
              Shadow(
                  offset: Offset(0, gap / 2),
                  blurRadius: gap * 3,
                  color: Colors.black45)
            ],
          ),
        ),
        barBlur: 50,
        borderWidth: 1,
        borderRadius: gap * 2,
        borderColor: errorColor.withOpacity(0.5),
        margin: const EdgeInsets.all(gap * 2),
        isDismissible: true,
        dismissDirection: GetPlatform.isAndroid
            ? DismissDirection.horizontal
            : DismissDirection.vertical,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 250),
        icon: const Icon(Icons.dangerous, color: errorColor),
        forwardAnimationCurve: Curves.bounceIn,
        boxShadows: [
          BoxShadow(
              // offset: const Offset(0, 0),
              blurRadius: MediaQuery.of(Get.context!).size.height,
              // color: Color.mv.11,\
              color: errorColor.withOpacity(0.5)),
        ],
        mainButton: ClickableWidget(
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap * 2),
              child: Text(btnText ?? "Dismiss",
                  style: const TextStyle(color: errorColor)),
            ),
            onTap: onTap ??
                () {
                  Get.back();
                }),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: errorColor.withOpacity(0.2));
  }
  return null;
}

SnackbarController? successSnackbar(
  String msg, {
  VoidCallback? onTap,
}) {
  if (!Get.isSnackbarOpen) {
    return Get.rawSnackbar(
        messageText: Text(
          msg.capitalize.toString(),
          style: const TextStyle(color: successColor, shadows: [
            Shadow(
                offset: Offset(0, gap / 2),
                blurRadius: gap * 3,
                color: Colors.black45),
          ]),
        ),
        barBlur: 50,
        borderWidth: 1,
        borderRadius: gap * 2,
        borderColor: successColor.withOpacity(0.5),
        margin: const EdgeInsets.all(gap * 2),
        isDismissible: true,
        dismissDirection: GetPlatform.isAndroid
            ? DismissDirection.horizontal
            : DismissDirection.vertical,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 250),
        icon: const Icon(Icons.done_outline_rounded, color: successColor),
        forwardAnimationCurve: Curves.bounceIn,
        boxShadows: [
          BoxShadow(
              // offset: const Offset(0, 0),
              blurRadius: MediaQuery.of(Get.context!).size.height,
              // color: Color.mv.11,\
              color: successColor.withOpacity(0.5)),
        ],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: successColor.withOpacity(0.2));
  }
  return null;
}
