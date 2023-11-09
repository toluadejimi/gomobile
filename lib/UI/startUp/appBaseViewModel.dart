import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/enums/app_states.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.router.dart';
import '../../models/user.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationService = NavigationService();
  final _localStorageService = LocalStorageService();

  AppStates? _state;
  AppStates? get state => _state;
  setAppState(AppStates val) {
    _state = val;
    notifyListeners();
  }

  Future<User>? _user;
  Future<User?> get user => _user ?? getUser();

  Future<User?> getUser() async {
    return await _localStorageService
        .getUserFromStorage(LocalStorageValues.user);
  }

  Future<void> startUp() async {
    var state = await _localStorageService
        .getStringFromStorage(LocalStorageValues.token);
    if (state == null || state == AppStates.unAuthenticated.name) {
      setAppState(AppStates.noState);
    } else {
      User? user = await _localStorageService
          .getUserFromStorage(LocalStorageValues.user);
      if (user != null) {
        print(user);
        // setUser(user);
        setAppState(AppStates.authenticated);
      } else {
        setAppState(AppStates.unAuthenticated);
      }
    }
  }

  String? validateInput(String? text) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim().isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? validateEmailInput(String? text) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim().isEmpty) {
      return 'Can\'t be empty';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text.trim())) {
      return 'This is not a valid email';
    }
    return null;
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

  logout() async {
    bool response = true;
    // await _authenticationService.signOut();
    if (response) {
      setAppState(AppStates.unAuthenticated);
      notifyListeners();
      navigationService.pushNamedAndRemoveUntil(Routes.appBaseScreen);
    }
  }

  showButtomModalSheet(
      {required BuildContext context,
      required Widget child,
      Color color = white,
      double curve = 20}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(curve),
      ),
      builder: (context) {
        return Wrap(children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                curve,
              ),
            ),
            child: child,
          ),
        ]);
      },
    );
  }
}
