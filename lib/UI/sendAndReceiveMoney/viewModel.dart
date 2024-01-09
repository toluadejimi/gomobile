import 'package:gomobilez/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SendAndReceiveMoneyViewmodel extends BaseViewModel{
   final navigationService = NavigationService();
   
navigateToSendMoneyToGomobilesUsersPage() {
    navigationService.navigateToSendMoneyToGomoblieUsersView();
  }

  navigateToSendMoneyToBankPage() {
    navigationService.navigateToSendMoneyToBankView();
  }
}