import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter/material.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/authservice.dart';

class ForgotPasswordViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();
  // final _naviagtion = locator<NavigationService>();
  final PageController pageController = PageController(initialPage: 0);

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

  pop(){
   navigationService.back();
  }

  googleLogIn() async {}
}
