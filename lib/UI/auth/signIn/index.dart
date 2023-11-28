import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/auth/signIn/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/customIconButton.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/smallButton.dart';
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
        backgroundColor: primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/png/login_image.png',
                  ),
                  Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 16.sp, color: grey),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: model.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        InputField(
                          hint: 'Email',
                          controller: model.emailTextController,
                          validator: (text) => model.validateEmailInput(text),
                        ),
                        InputField(
                          controller: model.passwordController,
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
                          validator: (text) =>
                              model.validatePasswordInput(text),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => model.goToForgotPasswordPage(),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15.sp)),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallButton(
                        text: 'Login',
                        click: () {
                          model.login();
                        },
                        loading: model.loading,
                        horizontalPadding: width(22.w),
                      ),
                      CustomIconButton(
                        click: () {
                          model.signUpWithBiometrics();
                        },
                        widget: SvgPicture.asset(
                          'assets/images/svg/login_icon_button.svg',
                          semanticsLabel: 'Login Image',
                          width: 20.w,
                        ),
                        verticalPadding: 12.h,
                        horizontalPadding: 18.w,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  LongButton(
                    text: 'Register',
                    click: () => model.goToRegistrationPage(),
                    color: black,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
