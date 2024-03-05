import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class DashBoardViewModel extends AppBaseViewModel {
  final PageController pageController = PageController(initialPage: 0);

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  changePageIndex(int val) {
    _pageIndex = val;
    notifyListeners();
  }

  slideChangePageIndex(int val) {
    changePageIndex(val);
  }

  changePage(int val) {
    pageController.animateToPage(val,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  showButtomModalSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Wrap(children: [
          Container(
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: child,
          ),
        ]);
      },
    );
  }
}
