import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FcmService {
  static void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(['FcmService----', message.notification!.title]);
        print(['FcmService----', message.notification!.body]);
      }
    });
  }
}
