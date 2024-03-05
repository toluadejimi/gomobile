import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/forgotPassword/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/onboardingCustomScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';

class NewPasswordView extends StatelessWidget {
  final ForgotPasswordViewModel model;
  const NewPasswordView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return OnboardingCustomScaffold(
      title: 'Reset Password',
      canPop: true,
      subTitle:
          'Enter your registered email, verification\ncode will be sent to the email .',
      onBackPress: () => model.goToPreviousPage(),
      body: [
        Form(
          key: model.resetViewFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
          InputField(
          hint: 'Password',
          suffixIcon: GestureDetector(
              onTap: () => model.setPasswordState(),
              child: Icon(
                model.passworState
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                color: black,
              )),
          obscureText: model.passworState,
          validator:(text)=> model.validatePasswordInput(text),
        ),
        InputField(
          hint: 'Confirm Password',
          suffixIcon: GestureDetector(
              onTap: () => model.setConformPasswordState(),
              child: Icon(
                model.confirmPasswordState
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                color: black,
              )),
          obscureText: model.confirmPasswordState,
          validator: (text) => model.validatePasswordInput2(text, model.password1TextController.value.text)
        ),
        ]),),
        const SizedBox(height: 50),
        LongButton(text: 'Continue', click: () => model.resendOTP(), loading: model.loading,),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
