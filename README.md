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
    
    



A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
