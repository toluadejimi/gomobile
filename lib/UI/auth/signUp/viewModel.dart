
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/helpers/enums/user_role.dart';
import 'package:flutter/material.dart';

import '../../../app/app.locator.dart';
import '../../../services/authservice.dart';

class SignUpViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();
  final PageController pageController = PageController(initialPage: 1);

  UserRoles _userRole = UserRoles.customer;
  UserRoles get userRole => _userRole;
  setUserRole(UserRoles val) {
    _userRole = val;
    notifyListeners();
  }

  bool _returningUser = false;
  bool get returningUser => _returningUser;
  setReturningUser(bool val) {
    _returningUser = val;
  }

  int _pageIndex = 1;
  int get pageIndex => _pageIndex;
  changePageIndex(int val) {
    _pageIndex = val;
    notifyListeners();
  }

  slideChangePageIndex(int val) {
    changePageIndex(val);
  }

  changePage(int val) {
    pageController.animateToPage(val,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  googleLogIn() async {
 
}
}
