import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:gomobilez/widgets/alreadyHaveAnAccount.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';

class EmailView extends StatelessWidget {
  final SignUpViewModel model;
  const EmailView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Verify Email',
      canPop: true,
      subTitle:
          'Enter your valid email, verification\ncode will be sent to the email .',
      onBackPress: () => model.goToPreviousPage(),
      body: [
        const InputField(hint: 'Email'),
        const SizedBox(height: 100),
        LongButton(text: 'Continue', click: () => model.goToNextPage()),
        const SizedBox(
          height: 5,
        ),
        Center(child: AlreadyHaveAnAccount(click: () => model.goToLoginPage()))
      ],
    );
  }
}
