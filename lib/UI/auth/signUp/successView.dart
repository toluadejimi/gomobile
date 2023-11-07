import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/onboardingCustomScaffold.dart';
import 'package:gomobilez/widgets/smallButton.dart';

class SuccessView extends StatelessWidget {
  final SignUpViewModel model;
  const SuccessView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return OnboardingCustomScaffold(
      body: [
        const SizedBox(height: 50),
        Center(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(40),
              decoration:
                  const BoxDecoration(color: green, shape: BoxShape.circle),
              child: SvgPicture.asset(
                './assets/images/svg/signup_success_cup.svg',
                semanticsLabel: 'Success Image',
                width: 55,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Congratulations',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your account has been\nsuccessfully created',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 50),
            SmallButton(text: 'Login', click: () => model.goToLoginPage())
          ]),
        ),
      ],
    );
  }
}
