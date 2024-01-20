// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCdHQwshhlyjObO-35_mjzBMpItWfWfcT8',
    appId: '1:822771469710:web:036e82817cdd54034b28df',
    messagingSenderId: '822771469710',
    projectId: 'beverages-shop',
    authDomain: 'beverages-shop.firebaseapp.com',
    storageBucket: 'beverages-shop.appspot.com',
    measurementId: 'G-YQFH0195ZW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg0XxpADnDPfyQBPJBdC8NDFM1VcQmz3w',
    appId: '1:822771469710:android:48ea75f4fa381b0f4b28df',
    messagingSenderId: '822771469710',
    projectId: 'beverages-shop',
    storageBucket: 'beverages-shop.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNr9_LaJcx2mzioOxxzAWsuILTHdHJOiY',
    appId: '1:822771469710:ios:1ac5676b523849d54b28df',
    messagingSenderId: '822771469710',
    projectId: 'beverages-shop',
    storageBucket: 'beverages-shop.appspot.com',
    iosBundleId: 'com.example.drinkShopFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNr9_LaJcx2mzioOxxzAWsuILTHdHJOiY',
    appId: '1:822771469710:ios:3829d64aa73906624b28df',
    messagingSenderId: '822771469710',
    projectId: 'beverages-shop',
    storageBucket: 'beverages-shop.appspot.com',
    iosBundleId: 'com.example.drinkShopFlutter.RunnerTests',
  );
}
