# Assignment
## Tasks
1. User login page with complete form validation
2. Registration Page
3. Implement firebase push notification

 Video link is [here](https://youtu.be/NITSqb2wJ5Y).
 Apk download link is [here](https://fromsmash.com/vt-assignment)

## Tech stack
  Flutter, Getx , Firebase Auth, Firebase Cloud Storage, Firebase Messaging

## Screenshots

### Login Screen
 ![Login Screen](https://github.com/ashish88pal/vt_assignment/blob/d14ef44d5d1456df99a62e6ea823f9ff2887dca3/screenshots/login.png?raw=true)
### Signup Screen
  ![Signup Screen](https://github.com/ashish88pal/vt_assignment/blob/d14ef44d5d1456df99a62e6ea823f9ff2887dca3/screenshots/signup.png?raw=true)

### Home Screen
  ![Home](https://github.com/ashish88pal/vt_assignment/blob/d14ef44d5d1456df99a62e6ea823f9ff2887dca3/screenshots/home.png?raw=true)













## Folder Structure of Project
```bash
Lib
|   main.dart
|   utils.dart
|
\---app
    +---data
    |       user_model.dart
    |
    +---modules
    |   +---home
    |   |   +---bindings
    |   |   |       home_binding.dart
    |   |   |
    |   |   +---controllers
    |   |   |       home_controller.dart
    |   |   |
    |   |   \---views
    |   |           home_view.dart
    |   |
    |   +---Login
    |   |   +---bindings
    |   |   |       login_binding.dart
    |   |   |
    |   |   +---controllers
    |   |   |       login_controller.dart
    |   |   |
    |   |   \---views
    |   |           login_view.dart
    |   |
    |   \---Signup
    |       +---bindings
    |       |       signup_binding.dart
    |       |
    |       +---controllers
    |       |       signup_controller.dart
    |       |
    |       \---views
    |               signup_view.dart
    |
    +---routes
    |       app_pages.dart
    |       app_routes.dart
    |
    +---services
    |       firestore_services.dart
    |       notification_service.dart
    |
    \---widgets
            custom_buttton.dart
            custom_snackbar.dart
```