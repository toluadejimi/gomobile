import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/alreadyHaveAnAccount.dart';
import 'package:gomobilez/widgets/onboardingCustomScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';

class RegisterView extends StatelessWidget {
  final SignUpViewModel model;
  const RegisterView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return OnboardingCustomScaffold(
      title: 'Register',
      subTitle: 'Join us at Gomobliez',
      onBackPress: () => model.goToPreviousPage(),
      body: [
        Form(
          key: model.registerViewFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              InputField(
                hint: 'First Name',
                controller: model.firstNameController,
                validator: (value) => model.validateInput(value),
              ),
              InputField(
                hint: 'Last Name',
                controller: model.lastNameController,
                validator: (value) => model.validateInput(value),
              ),
              InputField(
                hint: 'Gender',
                controller: model.genderController,
                validator: (value) => model.validateInput(value),
              ),
              InputField(
                hint: 'Password',
                controller: model.registrationPassword1Controller,
                suffixIcon: GestureDetector(
                    onTap: () => model.setPasswordState(),
                    child: Icon(
                      model.passworState
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: black,
                    )),
                obscureText: model.passworState,
                validator: (value) => model.validatePasswordInput(value),
              ),
              InputField(
                hint: 'Confirm Password',
                controller: model.registrationPassword2Controller,
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
                    value, model.registrationPassword1Controller.value.text),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        LongButton(text: 'Continue', click: () => model.register(), loading: model.loading,),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: AlreadyHaveAnAccount(
            click: () => model.goToLoginPage(),
          ),
        )
      ],
    );
  }
}
