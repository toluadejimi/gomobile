import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../services/telnyx_service.dart';

class APPCallingScreen extends StatefulWidget {
  final String phoneNumber, name, seconds;
  const APPCallingScreen(
      {super.key,
      required this.phoneNumber,
      required this.name,
      required this.seconds});

  @override
  State<APPCallingScreen> createState() => _APPCallingScreenState();
}

class _APPCallingScreenState extends State<APPCallingScreen> {
  bool invitation = false;
  bool ongoingCall = false;
  bool _isMicOn = true;
  bool _isSpeakerOn = false;
  final logger = Logger();

  void _observeResponses() {
    Provider.of<TelnyxService>(context, listen: true).observeResponses();
    invitation =
        Provider.of<TelnyxService>(context, listen: true).ongoingInvitation;
    ongoingCall = Provider.of<TelnyxService>(context, listen: true).ongoingCall;
  }

  void _callDestination(String phoneNumber) {
    Provider.of<TelnyxService>(context, listen: false).call(phoneNumber);
    logger.i('Calling!');
  }

  void _disConnect() {
    Provider.of<TelnyxService>(context, listen: false).disconnect();
    logger.i('Disconnecting!');
  }

  void _handleEnd() {
    if (Provider.of<TelnyxService>(context, listen: false).ongoingCall) {
      Provider.of<TelnyxService>(context, listen: false).endCall();
    }
    Provider.of<TelnyxService>(context, listen: false).disconnect();

    Navigator.pop(context);
    logger.i('End CAll!');
  }

  @override
  void initState() {
    super.initState();
    Provider.of<TelnyxService>(context, listen: false)
        .addListener(_onProviderChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TelnyxService>(context, listen: false).observeResponses();
      _callDestination(widget.phoneNumber);
    });
  }

  Timer? _timer;
  int _seconds = 0;

  onTimerStart() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
      if (_seconds >= int.parse(widget.seconds)) {
        //end call if the person second is done
        _handleEnd();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    // _disConnect();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _onProviderChange() {
    if (Provider.of<TelnyxService>(context, listen: false).ongoingCall ==
        true) {
      onTimerStart();
    }
  }

  @override
  Widget build(BuildContext context) {
    _observeResponses();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepPurple, Colors.red],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/png/logo.png'),
            ),
            const SizedBox(height: 20),
            Text(
              widget.name ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _formatDuration(_seconds),
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IgnorePointer(
                  ignoring: Provider.of<TelnyxService>(context, listen: false)
                          .ongoingCall ==
                      false,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isMicOn = !_isMicOn;
                      });
                      Provider.of<TelnyxService>(context, listen: false)
                          .muteUnmute();
                      // Add logic to enable/disable microphone
                    },
                    icon: Icon(_isMicOn ? Icons.mic : Icons.mic_off),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _handleEnd();
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.call_end),
                ),
                // FloatingActionButton(
                //   onPressed: () {
                //     // Action for accepting the call
                //   },
                //   backgroundColor: Colors.green,
                //   child: const Icon(Icons.call),
                // ),
                IgnorePointer(
                  ignoring: Provider.of<TelnyxService>(context, listen: false)
                          .ongoingCall ==
                      false,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isSpeakerOn = !_isSpeakerOn;
                      });
                      print("pause");
                      Provider.of<TelnyxService>(context, listen: false)
                          .toggleSpeakerPhone();
                    },
                    icon:
                        Icon(_isSpeakerOn ? Icons.volume_up : Icons.volume_off),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
