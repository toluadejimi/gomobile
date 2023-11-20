import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/enums/app_states.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.router.dart';
import '../../models/user.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationService = NavigationService();
  final _localStorageService = LocalStorageService();
  UserService _userService = locator<UserService>();

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
    var token = await _localStorageService
        .getStringFromStorage(LocalStorageValues.token);
    if (token == null) {
      User? user = await _localStorageService
          .getUserFromStorage(LocalStorageValues.user);
      if (user == null) {
        setAppState(AppStates.noState);
      } else {
        setAppState(AppStates.unAuthenticated);
      }
    } else {
      User? user = await _localStorageService
          .getUserFromStorage(LocalStorageValues.user);
      if (user != null) {
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
    // remove only token.
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
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(curve), topRight: Radius.circular(curve)),
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

  void _showCountryPicker(BuildContext context, click, close) {
    showCountryPicker(
      useSafeArea: true,
      context: context,
      // favorite: <String>['SE'],
      showPhoneCode: true,
      onSelect: (Country country) {
        // print('Selected country: ${country.displayName}');
        click(country);
      },
      onClosed: () => {close(context)},
      countryListTheme: CountryListThemeData(
        flagSize: 40,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        inputDecoration: InputDecoration(
          labelText: '',
          hintText: 'Start typing to search',
          suffixIcon: const Icon(Icons.search),
          fillColor: transaparentGrey,
          filled: true,
          hoverColor: white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: white, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: transparentWhite, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        ),
        searchTextStyle: TextStyle(fontSize: 16),
      ),
    );
  }

  get displayCountryPicker => _showCountryPicker;

  refreshUser() async {
    try {
      http.Response response = await _userService.getUser();

      var raw = jsonDecode(response.body);
      print(raw);

      if (raw['status'] == true) {
        User user = userFromJson(jsonEncode(raw['data']));

        var success = await _localStorageService.addUserToStorage(
            LocalStorageValues.user, user);
        if (!success) {
          throw ('Something went wrong');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void copyTextToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Alertify(title: 'Copied', message: 'Copied to clipboard').success();
  }
}
