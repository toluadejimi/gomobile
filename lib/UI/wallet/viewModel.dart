import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/enums/payment_options.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:gomobilez/models/fund_wallet.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:http/http.dart' as http;

class WalletViewModel extends DashBoardViewModel {
  PaymentService _paymentService = locator<PaymentService>();
  TextEditingController amounController = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;
  setLoadingState() {
    _loading = !_loading;
    notifyListeners();
  }

  PaymentOptions _vendor = PaymentOptions.none;
  PaymentOptions get vendor => _vendor;
  setVendor(PaymentOptions val) {
    _vendor = val;
    notifyListeners();
  }

  proceedToFundWallet() async {
    if (amounController.value.text.trim().isNotEmpty &&
        vendor.name.isNotEmpty) {
      setLoadingState();
      try {
        var data = {
          "amount": int.parse(amounController.value.text.trim()),
          "vendor": vendor.name
        };
        http.Response response = await _paymentService.fundAccount(data);
        print(json.decode(response.body));
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          var raw = jsonDecode(dataAfterResponseHandler);
          print(raw);

          if (raw['status'] == true) {
            FundWallet data = fundWalletFromJson(jsonEncode(raw['body']));

            navigationService.navigateTo(Routes.webPageView,
                arguments: WebPageViewArguments(url: data.href));
            // if (!success) {
            //   throw ('Something went wrong');
            // }
            // success = await _localStorageService.addUserToStorage(
            //     LocalStorageValues.user, user);
            // if (!success) {
            //   throw ('Something went wrong');
            // }
            // goToApp();
          }
        } else {
          throw ({'message': 'An error occured'});
        }
      } catch (e) {
        errorHandler(e);
      }

      setLoadingState();
    }
  }
}
