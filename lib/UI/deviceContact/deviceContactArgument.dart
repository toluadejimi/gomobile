import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

class DeviceContactArgument extends StatelessWidget {
   final String title;
  final void Function(Contact) click;
  const DeviceContactArgument({Key? key, required this.title, required this.click}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}