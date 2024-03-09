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
import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';

import '../../../app/app.locator.dart';
import '../../../services/authService.dart';

class LoginViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();
  final _tokenService = locator<TokenService>();
  final _localStorageService = locator<LocalStorageService>();
  final LocalAuthentication _bioMetricsAuth = LocalAuthentication();

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
  setLoadingState(bool val) {
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
      setLoadingState(true);
      try {
        var data = {
          "email": emailTextController.value.text.trim(),
          "password": passwordController.value.text.trim()
        };
        http.Response response = await _authenticationService.login(data);
        String? dataAfterResponseHandler = responseHandler(response);
        print("Miracle $dataAfterResponseHandler");
        if (dataAfterResponseHandler != null) {
          var raw = jsonDecode(dataAfterResponseHandler);
          print(raw);

          if (raw['status'] == true) {
            User user = userFromJson(jsonEncode(raw['data']));
            bool success = await _tokenService.setToken(raw['data']['token']);
            if (!success) {
              setLoadingState(false);
              throw ('Something went wrong');
            }

            success =
                await _localStorageService.addAuthCredentialsToStorage(data);
            success = await _localStorageService.addUserToStorage(
                LocalStorageValues.user, user);
            if (!success) {
              setLoadingState(false);
              throw ('Something went wrong');
            }
            goToApp();
          }
          setLoadingState(false);
        } else {
          setLoadingState(false);
          // Alertify(title: 'Some went wrong', message: 'Try again later')
          //     .error();
        }
      } catch (e) {
        setLoadingState(false);
        print(e);
        errorHandler(e);
      }
    }
  }

  signUpWithBiometrics() async {
    try {
      final bool canAuthenticateWithBiometrics =
          await _bioMetricsAuth.canCheckBiometrics;

      if (canAuthenticateWithBiometrics) {
        bool isAuthenticated = await _bioMetricsAuth.authenticate(
            localizedReason:
                'Authenticate to access the app', // Displayed to the user
            options: const AuthenticationOptions(
                biometricOnly: true, useErrorDialogs: true, stickyAuth: true));

        if (isAuthenticated) {
          Map<String, dynamic>? authCredentials =
              await _localStorageService.getAuthCredentialsFromStorage();
          if (authCredentials != null) {
            emailTextController.text = authCredentials['email'];
            passwordController.text = authCredentials['password'];
            await login();
            return;
          } else {
            Alertify(
                    title: "Failed",
                    message: 'Login with your credentials first')
                .error();
            return;
          }
        } else {
          // Biometric authentication failed
          // Handle accordingly (e.g., show an error message)
          Alertify(title: "Failed", message: 'Authentication Failed').error();
          return;
        }
      } else {
        Alertify(
                title: "Action Not Supported",
                message: 'Your device does not support bimetric login')
            .error();
        return;
      }
    } catch (e) {
      Alertify(title: "Fialed", message: "Error authenticating").error();
    }
  }

  goToApp() {
    navigationService.pushNamedAndRemoveUntil(Routes.appBaseScreen);
  }
}
