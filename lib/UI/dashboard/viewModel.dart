import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter/material.dart';

class DashBoardViewModel extends AppBaseViewModel {
  final PageController pageController = PageController(initialPage: 1);


  int _pageIndex = 1;
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
}
