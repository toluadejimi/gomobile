import 'package:flutter/material.dart';
import 'package:gomobilez/UI/updatePassword/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:stacked/stacked.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdatePasswordViewModel>.reactive(
      builder: (context, model, child) => CustomScaffold(
          title: 'My Profile Settings',
          canPop: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: model.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      InputField(
                        hint: 'New password',
                        controller: model.passwordController,
                        suffixIcon: GestureDetector(
                            onTap: () => model.setPasswordState(),
                            child: Icon(
                              model.passworState
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              color: black,
                            )),
                        obscureText: model.passworState,
                        validator: (value) =>
                            model.validatePasswordInput(value),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      InputField(
                        hint: 'Confirm password',
                        controller: model.confirmPasswordController,
                        suffixIcon: GestureDetector(
                            onTap: () => model.setConformPasswordState(),
                            child: Icon(
                              model.confirmPasswordState
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              color: black,
                            )),
                        obscureText: model.confirmPasswordState,
                        validator: (value) => model.validatePasswordInput2(
                            value, model.confirmPasswordController.value.text),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                LongButton(text: 'Reset Password', click: () {}),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )),
      viewModelBuilder: () => UpdatePasswordViewModel(),
    );
  }
}
