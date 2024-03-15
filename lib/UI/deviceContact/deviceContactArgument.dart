import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';

class DeviceContactArgument extends StatelessWidget {
  final String title;
  final void Function(Contact) click;
  const DeviceContactArgument(
      {Key? key, required this.title, required this.click})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
