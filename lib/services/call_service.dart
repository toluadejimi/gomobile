import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gomobilez/services/telnyx_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:telnyx_webrtc/config/telnyx_config.dart';

class CallService {
  Future<void> callLogin(BuildContext context) async {
    String? token;
    if (defaultTargetPlatform == TargetPlatform.android) {
      token = (await FirebaseMessaging.instance.getToken())!;
      log("Android notification token :: $token");
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      token = await FlutterCallkitIncoming.getDevicePushTokenVoIP();
      log("iOS notification token :: $token");
    }

    var credentialConfig = CredentialConfig(
        dotenv.env['SIPUSERNAME']!,
        dotenv.env['SIPPASS']!,
        dotenv.env['SIPNAME']!,
        dotenv.env['PHONENO']!,
        token,
        true,
        "",
        "");
    Provider.of<TelnyxService>(context, listen: false).login(credentialConfig);
  }

  Future<void> checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.audio,
      Permission.microphone,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.contacts
    ].request();
    print(statuses[Permission.microphone]);
    print(statuses[Permission.bluetooth]);
  }
}
