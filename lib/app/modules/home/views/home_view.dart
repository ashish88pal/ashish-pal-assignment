import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../utils.dart';
import '../../../widgets/custom_buttton.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.name.value.isNotEmpty
                  ? "Welcome  ${controller.name.value}  ! 😃"
                  : "",
              style: headingStyle,
            ).animate().fade().slideX(),
            actions: [
              Padding(
                padding: const EdgeInsets.all(gap*2),
                child: ClickableWidget(
                  onTap: controller.logout,
                  widget: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: controller.isloading.value
              ?  Center(child: LoadingAnimationWidget.threeRotatingDots(color: themeColor, size: Get.width/3))
              :
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("All Users", style: headingStyle,),
                  SizedBox(
                    height: Get.height -kToolbarHeight - gap*11,
                    child: ListView.builder(

                        itemCount: controller.userList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical:gap*2, horizontal:gap*4),
                            child: Container(
                              padding: const EdgeInsets.all(gap*2),


                              decoration: BoxDecoration(
                                color: themeColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(gap*2)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name : ${controller.userList[index].name}"),
                                   Text("Email : ${controller.userList[index].email}"),
                                   const SizedBox(height: gap/2,),
                                  MyCustomButton(
                                    text: "Send Notification",
                                    color: Colors.black,
                                    onTap: () async {

                                      await controller.sendNotification(
                                          controller.userList[index].fcmToken);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ).animate().fadeIn();
                        }),
                  ),
                ],
              ),
        ));
  }
}
