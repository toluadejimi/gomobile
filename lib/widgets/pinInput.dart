import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:pinput/pinput.dart';

class PinInput extends StatelessWidget {
  // final defaultPinTheme = PinTheme(
  //   width: 56,
  //   height: 56,
  //   textStyle: TextStyle(
  //       fontSize: 20,
  //       color: Color.fromRGBO(30, 60, 87, 1),
  //       fontWeight: FontWeight.w600),
  //   decoration: BoxDecoration(
  //     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
  //     borderRadius: BorderRadius.circular(20),
  //   ),
  // );

  // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  //   borderRadius: BorderRadius.circular(8),
  // );

  // final submittedPinTheme = defaultPinTheme.copyWith(
  //   decoration: defaultPinTheme.decoration.copyWith(
  //     color: Color.fromRGBO(234, 239, 243, 1),
  //   ),
  // );
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      // defaultPinTheme: defaultPinTheme
      // focusedPinTheme: focusedPinTheme,
      // submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
