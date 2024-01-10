import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/manageSubscription/bottomSheet.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/plans.dart';
import 'package:gomobilez/models/user.dart' as page;
import 'package:gomobilez/services/settingsService.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

class ManageSubscriptionViewModel extends WalletViewModel {
  SettingsService _settingsService = locator<SettingsService>();
  UserService _userService = locator<UserService>();

  Future<Plans>? _plans = null;
  Future<Plans>? get plans => _plans;
  setPlans(Future<Plans>? val) {
    _plans = val;
    notifyListeners();
  }

  init() {
    getPlans();
  }

  final navigationService = NavigationService();
  navigateToSubsciptionPlanPage() {
    navigationService.navigateTo('/subsciption-plan-view');
  }

  getPlans() async {
    try {
      http.Response response = await _settingsService.getPlans();
      String? dataAfterResponseHandler = response.body;

      var raw = jsonDecode(dataAfterResponseHandler);
      print(raw['data']['sms_plan']);
      print(raw['data']['call_plan']);

      if (raw['status'] == true) {
        Plans data = plansFromJson(jsonEncode(raw['data']));

        setPlans(Future.value(data));
      }
    } catch (e) {
      errorHandler(e);
    }
  }

  onSubscriptionPressed(
      BuildContext context, Plan plan, ManageSubscriptionViewModel model) {
    return showButtomModalSheet(
        context: context,
        child: SubscriptionBottomSheet(
            model: model, title: 'Subscribe', plan: plan));
  }

  Future<Plan?> getCurrentPlan() async {
    page.User? userDetails = await user;
    Plans? listOfPlans = await plans;
    if (userDetails!.myPlan != null && listOfPlans != null) {
      if (listOfPlans.callPlan
              .where((plan) => plan.id == userDetails.myPlan!.planId)
              .length !=
          0) {
        return listOfPlans.callPlan
            .where((plan) => plan.id == userDetails.myPlan!.planId)
            .toList()[0];
      } else if (listOfPlans.comboPlans
              .where((plan) => plan.id == userDetails.myPlan!.planId)
              .length !=
          0) {
        return listOfPlans.comboPlans
            .where((plan) => plan.id == userDetails.myPlan!.planId)
            .toList()[0];
      } else {
        return listOfPlans.smsPlan
            .where((plan) => plan.id == userDetails.myPlan!.planId)
            .toList()[0];
      }
    } else {
      return null;
    }
  }

  onResubscriptionPressed(
      BuildContext context, ManageSubscriptionViewModel model) async {
    Plan? currentPlan = await getCurrentPlan();
    if (currentPlan != null) {
      return showButtomModalSheet(
          context: context,
          child: SubscriptionBottomSheet(
              model: model, title: 'Resubscribe', plan: currentPlan));
    }
  }

  CancelSubscription() async {
    try {
      page.User? userDetails = await user;
      http.Response response = await _userService
          .cancelSubscription({"id": userDetails!.myPlan!.planId});
      var raw = jsonDecode(response.body);

      if (raw['status'] == true) {
        Alertify(title: 'Success', message: 'Subscription sucessfully canceled').success();
        print(raw);
        navigationService.back();
        await refreshUser();
      } else {
        Alertify(title: 'Process Failed', message: 'Try again later').error();
      }
    } catch (e) {
      errorHandler(error);
    }

    navigationService.back();
  }

  subscribeAgain(id) async {
    try {
      setSubLoadingState(true);
      http.Response response = await _userService.subscribeAgain({"id": id});
      var raw = jsonDecode(response.body);
      if (raw['status'] == true) {
        print(raw);
        Alertify(title: 'Successfully resubscribed').success();
        setSubLoadingState(false);
        refreshUser();
      } else {
        print(response.statusCode);
        setSubLoadingState(false);
        Alertify(title: 'Resubscription Failed', message: 'Try again later')
            .error();
      }
    } catch (e) {
      setSubLoadingState(false);
      errorHandler(error);
    }
    navigationService.back();
  }

  bool _subLoading = false;
  bool get subLoading => _subLoading;
  setSubLoadingState(bool val) {
    _subLoading = val;
    notifyListeners();
  }

  subscribe(id) async {
    try {
      setSubLoadingState(true);
      http.Response response =
          await _userService.subscribe({"id": id.toString()});
      var raw = jsonDecode(response.body);
      if (raw['status'] == true) {
        print(raw);
        Alertify(title: 'Success', message: 'Successfully subscribed').success();
        setSubLoadingState(false);
        refreshUser();
      } else {
        setSubLoadingState(false);
        Alertify(title: 'Subscription Failed', message: 'Try again later')
            .error();
      }
    } catch (e) {
      setSubLoadingState(false);
      errorHandler(error);
    }
    navigationService.back();
  }

  onCancleSubClick(context) async {
    await createCriticalDialog(
        context, 'Cancel Plan', 'Are you sure you want to\n cancel this plan',
        () async {
      await CancelSubscription();
      notifyListeners();
    }, () {
      navigationService.back();
    });
  }
}
