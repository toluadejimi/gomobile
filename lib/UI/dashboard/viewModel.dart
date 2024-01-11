import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/models/user.dart';

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

  bool _showNotification = false;
  bool get showNotification => _showNotification;
  setShowNotification(bool val) {
    _showNotification = val;
    notifyListeners();
  }

  initShowNotification() async {
    User? data = await user;

    if (data!.myPlan != null && data.myPlan!.status !=0 && data.myPlan!.daysRemaining! < 5) {
      setShowNotification(true);
    } else {
      setShowNotification(false);
    }
  }

  }
