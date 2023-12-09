import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.router.dart';

class GetStartedViewModel extends AppBaseViewModel {

  goToNextPage(){
   navigationService.replaceWith(Routes.signUpView);
  }
}