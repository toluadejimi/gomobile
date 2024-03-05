import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class ContactLoadingScreen extends StatelessWidget {
  const ContactLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          color: veryTransparentWhite,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ));
  }
}
