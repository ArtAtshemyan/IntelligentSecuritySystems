import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intelligent_security_systems/generated/intl/messages_en.dart';

class FcmService {
  static void firebaseInit(){
    FirebaseMessaging.onMessage.listen(
        (message){
          print(['FcmService----',message.notification!.title]);
          print(['FcmService----',message.notification!.body]);
    }
    );
  }
}