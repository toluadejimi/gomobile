import 'package:flutter/material.dart';
import 'package:gomobilez/UI/call/widget/invitation_widget.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../services/telnyx_service.dart';
import 'call_screen.dart';

class HomeCallScreen extends StatefulWidget {
  const HomeCallScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeCallScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeCallScreen> {
  final logger = Logger();
  TextEditingController destinationController = TextEditingController();

  bool invitation = false;
  bool ongoingCall = false;

  @override
  void initState() {
    super.initState();
  }

  void _observeResponses() {
    Provider.of<TelnyxService>(context, listen: true).observeResponses();
    invitation =
        Provider.of<TelnyxService>(context, listen: true).ongoingInvitation;
    ongoingCall = Provider.of<TelnyxService>(context, listen: true).ongoingCall;
  }

  void _callDestination() {
    Provider.of<TelnyxService>(context, listen: false)
        .call(destinationController.text);
    logger.i('Calling!');
  }

  void handleOptionClick(String value) {
    switch (value) {
      case 'Logout':
        Provider.of<TelnyxService>(context, listen: false).disconnect();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed('/');
        });
        logger.i('Disconnecting!');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _observeResponses();
    if (invitation) {
      return InvitationWidget(
          title: 'Home',
          invitation: Provider.of<TelnyxService>(context, listen: false)
              .incomingInvitation);
    } else if (ongoingCall) {
      return CallScreen(
        title: "Ongoing Call",
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleOptionClick,
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: destinationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Destination',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    _callDestination();
                  },
                  child: const Text('Call'),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
