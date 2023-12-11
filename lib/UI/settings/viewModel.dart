import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';

class SettingsViewModel extends DashBoardViewModel {
  goToUpdateProfilePage() {
    navigationService.navigateTo(Routes.updateProfileView);
  }
 }
