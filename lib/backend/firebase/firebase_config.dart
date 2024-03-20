import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCw9rSD3d6CojITaJQ_JCmskE2H_ThPbUY",
            authDomain: "travel-app-2vennz.firebaseapp.com",
            projectId: "travel-app-2vennz",
            storageBucket: "travel-app-2vennz.appspot.com",
            messagingSenderId: "970320027251",
            appId: "1:970320027251:web:cc7d34d8261bd3f4811406"));
  } else {
    await Firebase.initializeApp();
  }
}
