import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';

class SettingsViewModel extends DashBoardViewModel {
  goToUpdateProfilePage() {
    navigationService.navigateTo(Routes.updateProfileView);
  }

  onDeletePressed(context) async {
    await createCriticalDialog(context, 'Delete Account',
        'Are you sure you want to\n delete this account?', () async {
      await deleteAccount();
    }, () {
      navigationService.back();
    });
  }
  
}
