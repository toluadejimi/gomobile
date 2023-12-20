import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/plans.dart';
import 'package:gomobilez/services/settingsService.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:gomobilez/widgets/base_text.dart';
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

  createDialog(BuildContext context, int Id) {
    return CupertinoAlertDialog(
      title: BaseText(
        'Are you sure you want to\n cancel this plan',
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        CupertinoDialogAction(
          child: BaseText(
            'Yes',
            color: blue,
          ),
          onPressed: () {
            CancelSubscription(Id);
            navigationService.back();
          },
        ),
        CupertinoDialogAction(
          child: BaseText(
            'No',
            color: blue,
          ),
          onPressed: () {
            navigationService.back();
          },
        ),
      ],
    );
  }

  CancelSubscription(id) async {
    try {
      http.Response response =
          await _userService.cancelSubscription({"id": id});
      var raw = jsonDecode(response.body);

      if (raw['status'] == true) {
        print(raw);
        await getPlans();
      } else {
        throw {'Error'};
      }
    } catch (e) {
      errorHandler(error);
    }
  }

  SubscribeAgain(id) async {
    try {
      http.Response response = await _userService.subscribeAgain({"id": id});
      var raw = jsonDecode(response.body);
      if (raw['status'] == true) {
        print(raw);
        Alertify(title: 'Successfully resubscribed');
      } else {
        print(response.statusCode);
        throw {'Error'};
      }
    } catch (e) {
      errorHandler(error);
    }
  }

  SubscribeDialog(context, Id) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Subscribe'),
          content: Text('Do you want to subscribe?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Subscribe(Id);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Subscribe(id) async {
    try {
      http.Response response = await _userService.subscribe({"id": id});
      var raw = jsonDecode(response.body);
      if (raw['status'] == true) {
        print(raw);
        Alertify(title: 'Successfully subscribed');
      } else {
        throw {'Error'};
      }
    } catch (e) {
      errorHandler(error);
    }
  }
}
