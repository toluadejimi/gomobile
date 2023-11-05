import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final VoidCallback click;
  const AlreadyHaveAnAccount({super.key, required this.click});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        text: 'Already have an account ? ',
        style: TextStyle(color: black),
        children: [
          TextSpan(
            text: 'Login',
            style: TextStyle(fontWeight: FontWeight.bold, color: white),
            recognizer:  TapGestureRecognizer()
              ..onTap = click,
          ),
        ],
      ),
    );
  }
}
