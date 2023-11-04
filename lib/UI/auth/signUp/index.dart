
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/size_config.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width(20), vertical: height(10)),
             ),
        ),
      ),
    );
  }
}
