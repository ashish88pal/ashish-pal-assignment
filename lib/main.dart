import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vt/app/services/notification_service.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await PushNotificationService().setupInteractedMessage();


  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute:



   FirebaseAuth.instance.currentUser!=null ? Routes.HOME : Routes.LOGIN

    //  HomePage(currentUser:  _firebaseAuthServices.currentUser,fb:  _firebaseAuthServices,) : SignUpPage(),)
      //  AppPages.INITIAL,

,
      getPages: AppPages.routes,
    ),
  );
}


// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'firebaseAuthServices.dart';
// import 'homePage.dart';
// import 'notification_controller.dart';
// import 'signUpPage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   await  Firebase.initializeApp();

//   await PushNotificationService().setupInteractedMessage();

//   final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();

//   bool isUserLoggedIn = await _firebaseAuthServices.isLoggedIn();

//   runApp(MaterialApp(
//       home:
//       // HomeView()
//          isUserLoggedIn ? HomePage(currentUser:  _firebaseAuthServices.currentUser,fb:  _firebaseAuthServices,) : SignUpPage(),)
//       // PublisherPage()
//       );


//   // runApp(MyApp());

// }



