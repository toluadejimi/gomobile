import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SendAndReceiveMoneyViewmodel extends BaseViewModel{
   final navigationService = NavigationService();
   
navigateToSendMoneyToGomobilesUsersPage() {
    navigationService.navigateTo('/send-money-to-gomoblie-users-view');
  }
}