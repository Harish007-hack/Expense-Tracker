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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPFmtoHhafkF4yca8J7pNGo5dPBIUM6rM',
    appId: '1:71201363179:android:5432e62d46d03954e65aae',
    messagingSenderId: '71201363179',
    projectId: 'expensetracker-d6bb2',
    storageBucket: 'expensetracker-d6bb2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCA2qhXRnGPbb90m3NWNUT8AxgR71NoBcc',
    appId: '1:71201363179:ios:d92a453d84f27d61e65aae',
    messagingSenderId: '71201363179',
    projectId: 'expensetracker-d6bb2',
    storageBucket: 'expensetracker-d6bb2.appspot.com',
    iosBundleId: 'com.example.expenseTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOtwWWWqQsg9m9lzIEvgNQscceKdPIlTA',
    appId: '1:746044249313:ios:57d6f2dc792c6a90d593a0',
    messagingSenderId: '746044249313',
    projectId: 'flutter-expensetracker-616af',
    storageBucket: 'flutter-expensetracker-616af.appspot.com',
    iosBundleId: 'com.example.expenseTracker',
  );
}