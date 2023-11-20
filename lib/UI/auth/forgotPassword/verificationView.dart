import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/auth/forgotPassword/viewModel.dart';
import 'package:gomobilez/widgets/onboardingCustomScaffold.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/pinInput.dart';

import '../../../helpers/app_colors.dart';

class ForgotPasswordVerificationView extends StatelessWidget {
  final ForgotPasswordViewModel model;
  const ForgotPasswordVerificationView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return OnboardingCustomScaffold(
      title: 'Verify',
      canPop: true,
      decoratedText: RichText(
        text: TextSpan(
          text: 'Verification code has been sent\nto ',
          style: TextStyle(color: black),
          children: <TextSpan>[
            TextSpan(
                text: model.emailTextController.text,
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' Kindly check\nspam folder if not found in inbox')
          ],
        ),
      ),
      onBackPress: () => model.goToPreviousPage(),
      body: [
        Center(
          child: PinInput(
            controller: model.emailTextController,
            validator: (value) => model.validateInput(value),
            onCompleted: (pin) => model.verifyEmailOTP(),
          ),
        ),
         SizedBox(height: 90.h),
        LongButton(text: 'Verify', click: () => model.verifyEmailOTP(), loading: model.loading,)
      ],
    );
  }
}
