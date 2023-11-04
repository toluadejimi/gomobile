
import 'package:gomobilez/UI/auth/signIn/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/size_config.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
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
