import 'dart:convert';

import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/plans.dart';
import 'package:gomobilez/services/settingsService.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

class ManageSubscriptionViewModel extends WalletViewModel {
  SettingsService _settingsService = locator<SettingsService>();

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
}
