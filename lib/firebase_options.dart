// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBamU6mOXS_gaxm03GJuc5kMD3uFm3lWG4',
    appId: '1:1045886783511:web:c20fcaab25815125534c52',
    messagingSenderId: '1045886783511',
    projectId: 'virus-restaurant',
    authDomain: 'virus-restaurant.firebaseapp.com',
    storageBucket: 'virus-restaurant.appspot.com',
    measurementId: 'G-2QGT4NDGPB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNBPCUNAF_QXg4La78N1ujbWgjwdmAkXI',
    appId: '1:1045886783511:android:af00d65a72eeef15534c52',
    messagingSenderId: '1045886783511',
    projectId: 'virus-restaurant',
    storageBucket: 'virus-restaurant.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP2i-K0i1XEEObsLk_BMJyNZzy_YiZIsU',
    appId: '1:1045886783511:ios:53260870c734b910534c52',
    messagingSenderId: '1045886783511',
    projectId: 'virus-restaurant',
    storageBucket: 'virus-restaurant.appspot.com',
    iosBundleId: 'com.example.virusRestaurant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCP2i-K0i1XEEObsLk_BMJyNZzy_YiZIsU',
    appId: '1:1045886783511:ios:53260870c734b910534c52',
    messagingSenderId: '1045886783511',
    projectId: 'virus-restaurant',
    storageBucket: 'virus-restaurant.appspot.com',
    iosBundleId: 'com.example.virusRestaurant',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBamU6mOXS_gaxm03GJuc5kMD3uFm3lWG4',
    appId: '1:1045886783511:web:53a5a7dabe32a465534c52',
    messagingSenderId: '1045886783511',
    projectId: 'virus-restaurant',
    authDomain: 'virus-restaurant.firebaseapp.com',
    storageBucket: 'virus-restaurant.appspot.com',
    measurementId: 'G-GTF2M0L1HJ',
  );
}