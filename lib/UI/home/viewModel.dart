import 'package:flutter/cupertino.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import '../../helpers/size_config.dart';

class HomeViewModel extends DashBoardViewModel {
  ScrollController listViewController = ScrollController();
  ScrollController listViewController2 = ScrollController();
  TextEditingController searchController = TextEditingController();

  double _searchHeight = height(16);
  double get searchHeight => _searchHeight;
  void setSearchHeight(double val) {
    if (height(16) > val) {
      _searchHeight = height(16) - (val - height(2));
    }
    notifyListeners();
  }

  bool _searching = false;
  bool get searching => _searching;
  setSearching(bool val) {
    _searching = val;
    notifyListeners();
  }

  bool _done = true;

  startSearch(val) async {
    if (listViewController.position.pixels < height(16) && _done) {
      _done = false;
      setSearchHeight(height(16));
      await listViewController.animateTo(height(16),
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
    !searching ? setSearching(true) : null;
    _done = true;
  }

  closeSearch(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    setSearching(false);
  }

  double searchResultHeight(BuildContext context) {
    return MediaQuery.of(context).size.height - height(23);
  }

  navigateToWeb() {
    navigationService.navigateTo(Routes.webPageView,
        arguments: WebPageViewArguments(url: 'url'));
  }

  navigateToFundWallet() {
    changePage(1);
    notifyListeners();
  }
}
