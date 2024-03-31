import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBDpU5XgVM_dL01KhRIw1m7Mtcx2RYKohU",
            authDomain: "chat-d1owyj.firebaseapp.com",
            projectId: "chat-d1owyj",
            storageBucket: "chat-d1owyj.appspot.com",
            messagingSenderId: "403433240249",
            appId: "1:403433240249:web:891d6a93df308941af4d68"));
  } else {
    await Firebase.initializeApp();
  }
}
