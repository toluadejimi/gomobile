import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/forgotPassword/viewModel.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';

class ForgotPasswordEmailView extends StatelessWidget {
  final ForgotPasswordViewModel model;
  const ForgotPasswordEmailView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Forgot Password',
      canPop: true,
      subTitle:
          'Enter your registered email, verification\ncode will be sent to the email .',
      onBackPress: () => model.pop(),
      body: [
        Form(
          key: model.emailViewFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: InputField(
            hint: 'Email',
            controller: model.emailTextController,
            validator: (value) => model.validateEmailInput(value),
          ),
        ),
        const SizedBox(height: 100),
        LongButton(text: 'Continue', click: () => model.verifyEmail(), loading: model.loading,),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
