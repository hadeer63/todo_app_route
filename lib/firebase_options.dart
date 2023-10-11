// import 'dart:html';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
//
// class DefaultFirebaseOptions{
//   static FirebaseOptions get currentPlatform{
//     if(kIsWeb){
//       throw UnsupportedError(
//         'DefaultFirebaseOptions have not been configured'
//         'you can reconfigure this by running the FlutterFire'
//       );
//     }
//     switch(defaultTargetPlatform){
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         throw UnsupportedError(
//             'DefaultFirebaseOptions have not been configured'
//             'you can reconfigure this by running the FlutterFire'
//         ); case TargetPlatform.windows:
//         throw UnsupportedError(
//             'DefaultFirebaseOptions have not been configured'
//             'you can reconfigure this by running the FlutterFire'
//         ); case TargetPlatform.linux:
//         throw UnsupportedError(
//             'DefaultFirebaseOptions have not been configured'
//             'you can reconfigure this by running the FlutterFire'
//         );
//       default:
//         throw UnsupportedError(
//     'DefaultFirebaseOptions have not been configured'
//         );
//     }
//   }
//
//   static const FirebaseOptions android =FirebaseOptions(
//       apiKey: '',
//       appId: '',
//       messagingSenderId: '',
//       projectId: 'to-do-app-route',
//   storageBucket: 'to-do-app-route.appspot.com'
//   );
//
//   static const FirebaseOptions ios =FirebaseOptions(
//       apiKey: '',
//       appId: '',
//       messagingSenderId: '',
//       projectId: 'to-do-app-route',
//   storageBucket: 'to-do-app-route.appspot.com',
//     iosBundleId: 'com.example.todoapproute'
//   );
// }