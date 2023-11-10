import 'package:flutter/cupertino.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import '../../helpers/size_config.dart';

class HomeViewModel extends DashBoardViewModel {
  ScrollController listViewController = ScrollController();
  ScrollController listViewController2 = ScrollController();
  TextEditingController searchController = TextEditingController();



  navigateToFundWallet() {
    changePage(1);
    notifyListeners();
  }
}
