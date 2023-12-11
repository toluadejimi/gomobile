import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/enums/payment_options.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:gomobilez/models/fund_wallet.dart';
import 'package:gomobilez/models/recentTransaction.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:http/http.dart' as http;

class WalletViewModel extends DashBoardViewModel {
  PaymentService _paymentService = locator<PaymentService>();
  TextEditingController amounController = TextEditingController();
  void init() {
    getRecentTransactions();
  }

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

  Future<List<RecentTransaction>?>? _recentTransaction = null;
  Future<List<RecentTransaction>?>? get recentTransaction => _recentTransaction;
  setRecentTransaction(Future<List<RecentTransaction>?>? val) {
    _recentTransaction = val;
    notifyListeners();
  }

  

  Future<List<RecentTransaction>?> getRecentTransactions() async {
    try {
      http.Response response = await _paymentService.getRecentTransaction();
      String? dataAfterResponseHandler = response.body;

      var raw = jsonDecode(dataAfterResponseHandler);
      if (raw['status'] == true) {
        List<RecentTransaction> transactions = [];
        if (raw['data']['transactions'].length > 0) {
          for (var i = 0; i < raw['data']['transactions'].length; i++) {
            transactions.add(recentTransactionFromJson(
                jsonEncode(raw['data']['transactions'][i])));
          }
        } else {
          throw ({'message': 'An error occured'});
        }
        setRecentTransaction(Future.value(transactions));
      }
      return null;
    } catch (e) {
      errorHandler(e);
      return null;
    }
  }

  navigateToSubscriptionPage(){
    navigationService.navigateToSubsciptionPlanView();
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
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          var raw = jsonDecode(dataAfterResponseHandler);

          if (raw['status'] == true) {
            FundWallet data = fundWalletFromJson(jsonEncode(raw['data']));

            navigationService.navigateTo(Routes.webPageView,
                arguments: WebPageViewArguments(url: data.href));
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
