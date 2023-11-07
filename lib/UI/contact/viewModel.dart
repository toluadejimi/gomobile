import 'package:gomobilez/UI/dashboard/viewModel.dart';

class ContactViewModel extends DashBoardViewModel {
  Future<List> getContactHistory() async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }
}
