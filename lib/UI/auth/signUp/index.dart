import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/signUp/emailView.dart';
import 'package:gomobilez/UI/auth/signUp/getStartedView.dart';
import 'package:gomobilez/UI/auth/signUp/registerView.dart';
import 'package:gomobilez/UI/auth/signUp/successView.dart';
import 'package:gomobilez/UI/auth/signUp/verificationView.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: model.pageController,
        children: [
          GetStartedView(
            model: model,
          ),
          EmailView(model: model),
          VerificationView(model: model),
          RegisterView(model: model),
          SuccessView(model: model)
        ],
      ),
    );
  }
}
