import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:gomobilez/models/user.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:gomobilez/services/tokenService.dart';
import 'package:http/http.dart' as http;

import '../../../app/app.locator.dart';
import '../../../services/authservice.dart';

class LoginViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();
  final _tokenService = locator<TokenService>();
  final _localStorageService = locator<LocalStorageService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _passwordState = true;
  bool get passworState => _passwordState;
  setPasswordState() {
    _passwordState = !_passwordState;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoadingState() {
    _loading = !_loading;
    notifyListeners();
  }

  goToRegistrationPage() {
    navigationService.pushNamedAndRemoveUntil(Routes.signUpView);
  }

  goToForgotPasswordPage() {
    navigationService.navigateTo(Routes.forgotPasswordView);
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setLoadingState();
      try {
        var data = {
          "email": emailTextController.value.text.trim(),
          "password": passwordController.value.text.trim()
        };
        http.Response response = await _authenticationService.login(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          var raw = jsonDecode(dataAfterResponseHandler);

          if (raw['status'] == true) {
            User user = userFromJson(jsonEncode(raw['data']));

            bool success = await _tokenService.setToken(raw['data']['token']);
            if (!success) {
              throw ('Something went wrong');
            }
            success = await _localStorageService.addUserToStorage(
                LocalStorageValues.user, user);
            if (!success) {
              throw ('Something went wrong');
            }
            goToApp();
          }
        } else {
          throw({'message':'An error occured'});
        }
      } catch (e) {
        errorHandler(e);
      }

      setLoadingState();
    }
  }

  goToApp() {
    navigationService.pushNamedAndRemoveUntil(Routes.appBaseScreen);
  }
}
