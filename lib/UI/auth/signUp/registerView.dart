import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/alreadyHaveAnAccount.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';

class RegisterView extends StatelessWidget {
  final SignUpViewModel model;
  const RegisterView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Register',
      subTitle: 'Join us at Gomobliez',
      onBackPress: () => model.goToPreviousPage(),
      body: [
        const InputField(hint: 'First Name'),
        const InputField(hint: 'Last Name'),
        const InputField(hint: 'Gender'),
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
        ),
        const SizedBox(height: 50),
        LongButton(text: 'Continue', click: () => model.goToNextPage()),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: AlreadyHaveAnAccount(click: ()=>model.goToLoginPage())
        )
      ],
    );
  }
}
