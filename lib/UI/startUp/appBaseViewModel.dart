import 'package:gomobilez/helpers/enums/app_states.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/services/authservice.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../models/user.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationService = NavigationService();
  final _localStorageService = LocalStorageService();
  final _authenticationService = locator<AuthService>();

  AppStates? _state;
  AppStates? get state => _state;
  setAppState(AppStates val) {
    _state = val;
    notifyListeners();
  }

  Future<UserModel>? _user;
  Future<UserModel>? get user => _user ?? getUser();

  Future<UserModel> getUser() {
    return _localStorageService
        .getMapFromStorage(LocalStorageValues.user)
        .then((value) => UserModel.fromJson(value!));
  }

  Future<void> startUp() async {
    var state = await _localStorageService
        .getStringFromStorage(LocalStorageValues.token);
    if (state == null || state == AppStates.unAuthenticated.name) {
      setAppState(AppStates.unAuthenticated);
    } else {
      Map<String, dynamic>? user =
          await _localStorageService.getMapFromStorage(LocalStorageValues.user);
      if (user != null) {
        print(user);
        // setUser(UserModel.fromJson(user));
        setAppState(AppStates.authenticated);
      } else {
        setAppState(AppStates.unAuthenticated);
      }
    }

    // nagivationService.navigateTo(Routes.homeView);
  }

  logout() async {
    bool response = await _authenticationService.signOut();
    if (response) {
      setAppState(AppStates.unAuthenticated);
      notifyListeners();
      navigationService.pushNamedAndRemoveUntil(Routes.appBaseScreen);
    }
  }
}
