import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.router.dart';

import '../../../app/app.locator.dart';
import '../../../services/authservice.dart';

class LoginViewModel extends AppBaseViewModel {
  final _authenticationService = locator<AuthService>();

  bool _passwordState = true;
  bool get passworState => _passwordState;
  setPasswordState() {
    _passwordState = !_passwordState;
    notifyListeners();
  }

  goToRegistrationPage() {
    navigationService.pushNamedAndRemoveUntil(Routes.signUpView);
  }

  goToForgotPasswordPage() {
    navigationService.navigateTo(Routes.forgotPasswordView);
  }
}
