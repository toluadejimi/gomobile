import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:gomobilez/widgets/alreadyHaveAnAccount.dart';
import 'package:gomobilez/widgets/onboardingCustomScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';

class EmailView extends StatelessWidget {
  final SignUpViewModel model;
  const EmailView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return OnboardingCustomScaffold(
      title: 'Verify Email',
      canPop: true,
      subTitle:
          'Enter your valid email, verification\ncode will be sent to the email .',
      onBackPress: () => model.goToPreviousPage(),
      body: [
        Form(
            key: model.emailViewFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                InputField(
                  hint: 'Email',
                  controller: model.emailTextController,
                  validator: (value) => model.validateEmailInput(value),
                ),
                const SizedBox(height: 100),
                LongButton(
                  text: 'Continue',
                  click: () => model.verifyEmail(),
                  loading: model.loading,
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        Center(child: AlreadyHaveAnAccount(click: () => model.goToLoginPage()))
      ],
    );
  }
}
