import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/pinInput.dart';

import '../../../helpers/app_colors.dart';

class VerificationView extends StatelessWidget {
  final SignUpViewModel model;
  const VerificationView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Verify',
      canPop: true,
      decoratedText: RichText(
        text: const TextSpan(
          text: 'Verification code has been sent\nto ',
          style: TextStyle(color: black),
          children: <TextSpan>[
            TextSpan(
                text: 'ol****@gm***.com',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' Kindly check\nspam folder if not found in inbox')
          ],
        ),
      ),
      onBackPress: () => model.goToPreviousPage(),
      body: [
        // const InputField(hint: 'Email'),
        Center(child: PinInput()),
        const SizedBox(height: 100),
        LongButton(text: 'Verify', click: () => model.goToNextPage())
      ],
    );
  }
}
