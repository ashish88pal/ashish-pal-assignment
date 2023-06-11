import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* ================================= Constants ============================*/

const gap = 6.0;
const themeColor = Color(0xFFFE0435);

const successColor = CupertinoColors.activeGreen;

const errorColor = CupertinoColors.destructiveRed;
const headingStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

const enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(gap)),
    borderSide: BorderSide(color: Color(0xFFE6E6E6)));

const focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(gap)),
    borderSide: BorderSide(color: Color(0xFFa6a6a6)));

const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(gap)),
    borderSide: BorderSide(color: Color(0xFFFE0435)));

const focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(gap)),
    borderSide: BorderSide(color: Color(0xFFFE0435)));





/* ================================= Validators ============================*/

String? nameValidation(value) {
  if (value!.isEmpty) {
    return "Enter Name";
  } else {
    return null;
  }
}

String? emailValidation(value) {
  if (value!.isEmpty) {
    return "Enter Email";
  } else if (!GetUtils.isEmail(value)) {
    return "Enter a valid email address";
  } else {
    return null;
  }
}

String? passwordValidation(value) {
  if (value!.isEmpty) {
    return "Enter password";
  } else if (value.isNotEmpty && (value.length < 6)) {
    return "Must be at least 6 characters";
  } else {
    return null;
  }
}


fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode? nextFocus) {
  currentFocus.unfocus();
  if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
}

