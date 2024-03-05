import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:http/http.dart' as http;

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/authservice.dart';

class ForgotPasswordViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();
  // final _naviagtion = locator<NavigationService>();

  final GlobalKey<FormState> emailViewFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetViewFormKey = GlobalKey<FormState>();

  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController password1TextController = TextEditingController();
  final TextEditingController password2TextController = TextEditingController();

  bool _passwordState = true;
  bool get passworState => _passwordState;
  setPasswordState() {
    _passwordState = !_passwordState;
    notifyListeners();
  }

  bool _confirmPasswordState = true;
  bool get confirmPasswordState => _confirmPasswordState;
  setConformPasswordState() {
    _confirmPasswordState = !_confirmPasswordState;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoadingState() {
    _loading = !_loading;
    notifyListeners();
  }

  goToNextPage() {
    if (pageController.page!.toInt() <= 1) {
      pageController.animateToPage(pageController.page!.toInt() + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  goToPreviousPage() {
    if (pageController.page!.toInt() > 0) {
      pageController.animateToPage(pageController.page!.toInt() - 1,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  goToPageDirectly(int val) {
    if (pageController.page!.toInt() >= 0 &&
        pageController.page!.toInt() <= 3) {
      pageController.animateToPage(val,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  goToLoginPage() {
    navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }

  pop() {
    navigationService.back();
  }

  verifyEmail() async {
    if (emailViewFormKey.currentState!.validate()) {
      setLoadingState();
      String email = emailTextController.text.trim();
      try {
        var data = {"email": email};
        http.Response response =
            await _authenticationService.forgotPasswordEmailVerifaction(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          goToNextPage();
        } else {
          throw(response.body);
        }
      } catch (e) {
        errorHandler(e);
      }
      setLoadingState();
    }
  }

  resendOTP() async {
    try {
      var data = {"email": emailTextController.value.text.trim()};
      http.Response response = await _authenticationService.resendOTP(data);

      String? dataAfterResponseHandler = responseHandler(response);
      if (dataAfterResponseHandler != null) {
        goToLoginPage();
      } else {
        throw(response.body);
      }
    } catch (e) {
      errorHandler(e);
    }
  }

  verifyEmailOTP() async {
    if (otpController.value.text.trim().length >= 4) {
      setLoadingState();
      try {
        if (emailTextController.value.text.trim() != '' &&
            otpController.value.text.trim() != '') {
          var data = {
            "email": emailTextController.value.text.trim(),
            "code": otpController.value.text.trim()
          };
          http.Response response =
              await _authenticationService.verifyEmailOTP(data);
          String? dataAfterResponseHandler = responseHandler(response);

          if (dataAfterResponseHandler != null) {
            goToNextPage();
          } else {
            throw(response.body);
          }
        }
      } catch (e) {
        errorHandler(e);
      }
      setLoadingState();
    }
  }

  resetPassword() async {
    if (resetViewFormKey.currentState!.validate()) {
      setLoadingState();
      String email = emailTextController.text.trim();
      String password = password1TextController.text.trim();
      try {
        var data = {"email": email, 'password': password};
        http.Response response =
            await _authenticationService.resetPassword(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          goToNextPage();
        } else {
          throw(response.body);
        }
      } catch (e) {
        errorHandler(e);
      }
      setLoadingState();
    }
  }
}
