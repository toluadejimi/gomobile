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
import 'package:gomobilez/models/saved_cards.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:http/http.dart' as http;

class WalletViewModel extends DashBoardViewModel {
  PaymentService _paymentService = locator<PaymentService>();
  TextEditingController amounController = TextEditingController();
  UserService _userService = locator<UserService>();

  void init() {
    getRecentTransactions();
    fetchSavedCards();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoadingState() {
    _loading = !_loading;
    notifyListeners();
  }

  String? _selectedCardId;
  String? get selectedCardId => _selectedCardId;
  setSelectedCard(String id) {
    _vendor = PaymentOptions.none;
    _selectedCardId = id;
    notifyListeners();
  }

  Future<List<Info>?>? _savedCards;
  Future<List<Info>?>? get savedCards => _savedCards;
  setSavedCards(Future<List<Info>?>? val) {
    _savedCards = val;
    notifyListeners();
  }

  fetchSavedCards() async {
    try {
      http.Response response = await _userService.getSavedCards();
      var raw = jsonDecode(response.body);

      if (raw['status'] == true) {
        print(raw);
        SavedCards savedCardsResponse =
            savedCardsFromJson(jsonEncode(raw['data']));
        setSavedCards(Future.value(savedCardsResponse.info));
      } else {
        throw {'Error'};
      }
    } catch (error) {
      errorHandler(error);
    }
  }

  PaymentOptions _vendor = PaymentOptions.none;
  PaymentOptions get vendor => _vendor;
  setVendor(PaymentOptions val) {
    _selectedCardId = null;
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

  navigateToSubscriptionPage() {
    navigationService.navigateToSubsciptionPlanView();
  }

  proceedToFundWallet() async {
    if (amounController.value.text.trim().isNotEmpty &&
        (vendor.name.isNotEmpty || selectedCardId != null)) {
      setLoadingState();
      try {
        var data = selectedCardId != null
            ? {
                "amount": int.parse(amounController.value.text.trim()),
                "customer_id": selectedCardId
              }
            : {
                "amount": int.parse(amounController.value.text.trim()),
                "vendor": vendor.name
              };
        http.Response response = selectedCardId != null
            ? await _paymentService.fundAccountWithCard(data)
            : await _paymentService.fundAccount(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          var raw = jsonDecode(dataAfterResponseHandler);

          if (raw['status'] == true) {
            if (selectedCardId != null) {
              navigationService.back();
            } else {
              FundWallet data = fundWalletFromJson(jsonEncode(raw['data']));

              navigationService.navigateTo(Routes.webPageView,
                  arguments: WebPageViewArguments(url: data.href));
            }
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
