import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/forgotPassword/emailView.dart';
import 'package:gomobilez/UI/auth/forgotPassword/newPasswordView.dart';
import 'package:gomobilez/UI/auth/forgotPassword/verificationView.dart';
import 'package:gomobilez/UI/auth/forgotPassword/viewModel.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (context, model, child) => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: model.pageController,
        children: [
          ForgotPasswordEmailView(model: model),
          ForgotPasswordVerificationView(model: model),
          NewPasswordView(model: model)

        ],
      ),
    );
  }
}
