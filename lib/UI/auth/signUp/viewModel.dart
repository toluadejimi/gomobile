import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/getDeviceId.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:http/http.dart' as http;

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/authService.dart';

class SignUpViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();
  final _storageService =locator<LocalStorageService>();

  final GlobalKey<FormState> emailViewFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerViewFormKey = GlobalKey<FormState>();

  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController signupOtpController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  //  TextEditingController genderController = TextEditingController();
  final TextEditingController registrationPassword1Controller =
      TextEditingController();
  final TextEditingController registrationPassword2Controller =
      TextEditingController();

       String? _genderController = null;
  String? get genderController => _genderController;
  setGenderController(Object? val) {
    // _genderController = val;
    notifyListeners();
  }

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

  bool _confirmPasswordState = true;
  bool get confirmPasswordState => _confirmPasswordState;
  setConformPasswordState() {
    _confirmPasswordState = !_confirmPasswordState;
    notifyListeners();
  }

  goToNextPage() {
    if (pageController.page!.toInt() <= 3) {
      pageController.animateToPage(pageController.page!.toInt() + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  goToPreviousPage() {
    if (pageController.page!.toInt() > 0) {
      pageController.animateToPage(pageController.page!.toInt() - 1,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  goToPageDirectly(int val) {
    if (pageController.page!.toInt() >= 0 &&
        pageController.page!.toInt() <= 4) {
      pageController.animateToPage(val,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  goToLoginPage() {
    navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }

  verifyEmail() async {
    if (emailViewFormKey.currentState!.validate()) {
      setLoadingState();
      String email = emailTextController.text.trim();
      try {
        var data = {"email": email};
        http.Response response = await _authenticationService.verifyEmail(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          goToNextPage();
        } else {
          throw (response.body);
        }
      } catch (e) {
        errorHandler(e);
      }
      setLoadingState();
    }
  }

  resendOTP() async {
    // yet to implement
    try {
      var data = {"email": emailTextController.value.text.trim()};
      http.Response response = await _authenticationService.resendOTP(data);
      throw (response.body);
    } catch (e) {
      errorHandler(e);
    }
  }

  verifyEmailOTP() async {
    if (signupOtpController.value.text.trim().length >= 4) {
      setLoadingState();
      try {
        if (emailTextController.value.text.trim() != '' &&
            signupOtpController.value.text.trim() != '') {
          var data = {
            "email": emailTextController.value.text.trim(),
            "code": signupOtpController.value.text.trim()
          };
          http.Response response =
              await _authenticationService.verifyEmailOTP(data);
          String? dataAfterResponseHandler = responseHandler(response);

          if (dataAfterResponseHandler != null) {
            goToNextPage();
          } else {
            throw (response.body);
          }
        }
      } catch (e) {
        errorHandler(e);
      }
      setLoadingState();
    }
  }

  register() async {
    if (registerViewFormKey.currentState!.validate() && _genderController != null) {
      setLoadingState();
      try {
        String? deviceId = await getId();
        var data = {
          "email": emailTextController.value.text.trim(),
          "device_id": deviceId,
          "first_name": firstNameController.value.text.trim(),
          "last_name": lastNameController.value.text.trim(),
          "gender": genderController!.trim(),
          "password": registrationPassword1Controller.value.text.trim()
        };
        http.Response response = await _authenticationService.register(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          _storageService.removeFromStorage(LocalStorageValues.credentialsToken);
          goToLoginPage();
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
