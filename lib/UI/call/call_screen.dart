import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gomobilez/UI/call/widget/dail_pad.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:telnyx_webrtc/config/telnyx_config.dart';

import '../../services/telnyx_service.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  TextEditingController callInputController = TextEditingController();
  TokenConfig? tokenConfig;

  @override
  void initState() {
    super.initState();
    initCredential();
  }

  init() async {
    var token = await FirebaseMessaging.instance.getToken();
    print("====> $token ");
    tokenConfig = TokenConfig(dotenv.env['TELNYXAPIKEY']!, "Gomobilez",
        dotenv.env['PHONENO']!, token, true);
    final myProvider = Provider.of<TelnyxService>(context, listen: false);
    myProvider.loginWithToken(tokenConfig!);
  }

  initCredential() async {
    var token = await FirebaseMessaging.instance.getToken();
    print("====> $token ");
    var credentialConfig = CredentialConfig("adewaletolu57512", "FsLopXYV",
        "Gomobilez", "3238311266", token, true, "", "");
    final myProvider = Provider.of<TelnyxService>(context, listen: false);
    myProvider.login(credentialConfig);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TelnyxService>(context, listen: true).observeResponses();
    Provider.of<TelnyxService>(context, listen: true).connect();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 16),
          // Text(widget.call?.sessionDestinationNumber ?? "Unknown Caller"),
          const SizedBox(height: 8),
          DialPad(
            backspaceButtonIconColor: Colors.red,
            dialButtonColor: Colors.red,
            makeCall: (number) {
              //End call
              Provider.of<TelnyxService>(context, listen: false).endCall();
            },
            keyPressed: (number) {
              callInputController.text =
                  callInputController.value.text + number;
              Provider.of<TelnyxService>(context, listen: false).dtmf(number);
            },
          ),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  print("mic");
                  Provider.of<TelnyxService>(context, listen: false)
                      .muteUnmute();
                },
                icon: const Icon(Icons.mic)),
            IconButton(
                onPressed: () {
                  print("speakerphone");
                  Provider.of<TelnyxService>(context, listen: false)
                      .toggleSpeakerPhone();
                },
                icon: const Icon(Icons.volume_up)),
            IconButton(
                onPressed: () {
                  print("pause");
                  Provider.of<TelnyxService>(context, listen: false)
                      .holdUnhold();
                },
                icon: const Icon(Icons.pause))
          ])
        ],
      )),
    );
  }
}
