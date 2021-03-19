# finalapp

A complete authentication example for Flutter and Firebase

## Getting Started

This project is a starting point for a Flutter application.

## Minimum Requirements
   ## Add Firebase
    1. Create a Firebase project
    2. Add your own google-services.json file by following https://firebase.flutter.dev/docs/installation/android
    3. Add your own GoogleService-Info.plist by following https://firebase.flutter.dev/docs/installation/ios
    4. Enable Cloud Firestore on your firebase project panel and set database rules to allow read, write: if request.auth.uid != null;
  
## Feature Requirements (Still under construction).
   ## Email/Password Authentication
      From the Authentication portion of your firebase project panel, enable email/password authentication under the sign-in method tab.

   ## Phone Auth
      From the Authentication portion of your firebase project panel, enable phone authentication under the sign-in method tab.
      Enable Apple Push Notifications
      Create FCM Key
      
 ## Reference packages/plugins
 ## NOTE: Try too get te latest versions(https://pub.dev/)->Search ->Go-to installation -> Copy dependencies -> paste in out pubspec.yaml File
   1. cupertino_icons: ^1.0.0
   2. flutter_signin_button: ^1.1.0
   3. font_awesome: ^5.10.1
   4. google_fonts: ^1.1.1
   5. firebase_core: ^0.5.3
   6. firebase_auth: ^0.18.4+1
   7. provider: ^4.3.2+3
   8. rxdart: ^0.25.0
   9. cloud_firestore: ^0.14.4
   10. loading_overlay: ^0.2.1
   11. flutter_login_facebook: ^0.4.2+1
   12. google_sign_in: ^4.5.6
    
 



A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
