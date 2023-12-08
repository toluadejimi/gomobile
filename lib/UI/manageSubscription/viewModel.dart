import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ManageSubscriptionViewModel extends BaseViewModel {
  final navigationService = NavigationService();
  navigateToSubsciptionPlanPage() {
    navigationService.navigateTo('/subsciption-plan-view');
  }
}
