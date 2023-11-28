import 'package:flutter/material.dart';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:gomobilez/models/user.dart';
import 'package:gomobilez/services/authservice.dart';
import 'package:http/http.dart' as http;

class UpdatePasswordViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();
  final GlobalKey<FormState> updatePasswordformKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _confirmPasswordState = true;
  bool get confirmPasswordState => _confirmPasswordState;
  setConformPasswordState() {
    _confirmPasswordState = !_confirmPasswordState;
    notifyListeners();
  }

  bool _passwordState = true;
  bool get passworState => _passwordState;
  setPasswordState() {
    _passwordState = !_passwordState;
    notifyListeners();
  }

  String? validatePasswordInput(String? text) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim().isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? validatePasswordInput2(String? text, String password1) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim() != password1.trim()) {
      return 'Password don\'t match';
    }
    return null;
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoadingState() {
    _loading = !_loading;
    notifyListeners();
  }

  updatePasword() async {
    if (updatePasswordformKey.currentState!.validate()) {
      setLoadingState();
      User? userData = await user;
      String email = await userData!.email;
      try {
        var data = {
          "email": email,
          "password": passwordController,
          "confirm_password": confirmPasswordController
        };
        http.Response response =
            await _authenticationService.resetPassword(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          navigationService.popUntil((route) => false);
          // goToNextPage();
        } else {
          throw (response.body);
        }
      } catch (e) {
        errorHandler(e);
      }
      setLoadingState();
    }
  }
}
