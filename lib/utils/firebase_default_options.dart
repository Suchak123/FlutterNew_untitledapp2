import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyClkW_tRKN4LBNGMAe7yuPPpNYxCFpT9Ro",
      authDomain: "fir-first-860c0.firebaseapp.com",
      projectId: "fir-first-860c0",
      storageBucket: "fir-first-860c0.appspot.com",
      messagingSenderId: "1035368396014",
      appId: "1:1035368396014:web:2971dd178cdb85c81d6fff"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyClkW_tRKN4LBNGMAe7yuPPpNYxCFpT9Ro",
      authDomain: "fir-first-860c0.firebaseapp.com",
      projectId: "fir-first-860c0",
      storageBucket: "fir-first-860c0.appspot.com",
      messagingSenderId: "1035368396014",
      appId: "1:1035368396014:web:2971dd178cdb85c81d6fff"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyClkW_tRKN4LBNGMAe7yuPPpNYxCFpT9Ro",
      authDomain: "fir-first-860c0.firebaseapp.com",
      projectId: "fir-first-860c0",
      storageBucket: "fir-first-860c0.appspot.com",
      messagingSenderId: "1035368396014",
      appId: "1:1035368396014:web:2971dd178cdb85c81d6fff"
  );

}
