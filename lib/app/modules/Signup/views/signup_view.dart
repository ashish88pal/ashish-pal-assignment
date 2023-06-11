import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../utils.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_buttton.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(gap * 4),
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    TextFormField(
                      controller: controller.name,
                      focusNode: controller.nameFocus,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: nameValidation,
                      onFieldSubmitted: (term) {
                        fieldFocusChange(context, controller.nameFocus,
                            controller.emailFocus);
                      },
                      decoration: const InputDecoration(
                          hintText: "Name",
                          focusColor: Color(0xFFF8F8F8),
                          filled: true,
                          fillColor: Color(0xFFF8F8F8),
                          enabledBorder: enabledBorder,
                          focusedBorder: focusedBorder,
                          errorBorder: errorBorder,
                          focusedErrorBorder: focusedErrorBorder,
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: themeColor,
                          )),
                    ),
                    const SizedBox(
                      height: gap * 4,
                    ),
                    TextFormField(
                      controller: controller.email,
                      focusNode: controller.emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,

                      validator: emailValidation,

                      onFieldSubmitted: (term) {
                        fieldFocusChange(context, controller.emailFocus,
                            controller.passowordFocus);
                      },
                      // obscureText: password ? true : false,
                      decoration: const InputDecoration(
                          hintText: "Email",
                          focusColor: Color(0xFFF8F8F8),
                          filled: true,
                          fillColor: Color(0xFFF8F8F8),
                          enabledBorder: enabledBorder,
                          focusedBorder: focusedBorder,
                          errorBorder: errorBorder,
                          focusedErrorBorder: focusedErrorBorder,
                          prefixIcon: Icon(
                            Icons.email,
                            color: themeColor,
                          )),
                    ),
                    const SizedBox(
                      height: gap * 4,
                    ),
                    Obx(() => TextFormField(
                          controller: controller.password,
                          focusNode: controller.passowordFocus,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validator: passwordValidation,
                          onFieldSubmitted: (term) {
                            fieldFocusChange(
                                context, controller.passowordFocus, null);
                          },
                          obscureText:
                              controller.isPassHidden.value ? true : false,
                          decoration: InputDecoration(
                            hintText: "Password",
                            // suffixIcon: Icon(Icons.remove_red_eye),
                            focusColor: const Color(0xFFF8F8F8),
                            filled: true,
                            fillColor: const Color(0xFFF8F8F8),

                            enabledBorder: enabledBorder,
                            focusedBorder: focusedBorder,
                            errorBorder: errorBorder,
                            focusedErrorBorder: focusedErrorBorder,

                            prefixIcon: ClickableWidget(
                                widget: Icon(
                                  controller.isPassHidden.value
                                      ? Icons.key_rounded
                                      : Icons.remove_red_eye,
                                  color: themeColor,
                                ),
                                onTap: () {
                                  controller.isPassHidden.value =
                                      !controller.isPassHidden.value;
                                }),
                          ),
                        )),
                    const SizedBox(
                      height: gap * 4,
                    ),
                    const Spacer(),
                    MyCustomButton(
                      padding: const EdgeInsets.all(gap * 3),
                      borderRadius: BorderRadius.circular(gap),
                      text: "SIGN UP",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                      onTap: controller.signup
                    ),
                    const SizedBox(
                      height: gap * 4,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        ClickableWidget(
                          onTap: () {
                            Get.offNamedUntil(Routes.LOGIN, (route) => false);
                          },
                          widget: const Text("LOGIN",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFE0435))),
                        )
                      ],
                    ).animate().fade().slideY(begin: 1,end: 0)
                  ].animate().fade()),
            ),
          ),
        ),
      ),
    );
  }
}
