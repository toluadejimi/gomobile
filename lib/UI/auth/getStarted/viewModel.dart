import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetStartedViewModel extends AppBaseViewModel {

  goToNextPage(){
   navigationService.replaceWith(Routes.signUpView);
  }
}