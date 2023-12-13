import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.router.dart';

class GetStartedViewModel extends AppBaseViewModel {
  goToNextPage(String val) {
    switch (val.toLowerCase()) {
      case 'register':
        {
          return navigationService.replaceWith(Routes.signUpView);
        }
        break;

      case 'login':
        {
          return navigationService.replaceWith(Routes.loginView);
        }
        break;
    }
  }
}
