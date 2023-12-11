import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:http/http.dart' as http;

class SendMoneyToGomoblieUsersViewmodel extends WalletViewModel {
  PaymentService _paymentService = locator<PaymentService>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  bool _emailVerified = false;
  Timer? _debounce;
  bool get emailVerified => _emailVerified;
  setEmailVerified(bool val) {
    _emailVerified = val;
  }

  String? _recipientName;
  String? get recipientName => _recipientName;
  setRecipientName(String val) {
    _recipientName = val;
    notifyListeners();
  }

  verifyEmail() async {
    if (validateEmailInput(emailTextController.text.trim()) == null) {
      setLoadingState();
      try {
        var data = {
          "email": emailTextController.text.trim(),
        };
        http.Response response = await _paymentService.verifyEmail(data);

        String? dataAfterResponseHandler = response.body;
        print(dataAfterResponseHandler);

        var raw = jsonDecode(dataAfterResponseHandler);

        if (raw['status'] == true) {
          setRecipientName(raw['data']['name']);
          setEmailVerified(true);
        } else {
          throw ({'message': 'An error occured'});
        }
      } catch (e) {
        errorHandler(e);
      }

      setLoadingState();
    }
  }

  onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      verifyEmail();
    });
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
        String? dataAfterResponseHandler = response.body;

          var raw = jsonDecode(dataAfterResponseHandler);

          if (raw['status'] == true) {
            navigationService.navigateTo(Routes.webPageView,
                arguments: WebPageViewArguments(url: raw['data']['href']));
          }
      } catch (e) {
        errorHandler(e);
      }

      setLoadingState();
    }
  }
}
