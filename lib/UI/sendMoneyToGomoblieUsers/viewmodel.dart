import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/bottomSheet.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/createPinBottomSheet.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/user.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;

class SendMoneyToGomoblieUsersViewmodel extends WalletViewModel {
  PaymentService _paymentService = locator<PaymentService>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController createPinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _emailVerified = false;
  Timer? _debounce;
  bool get emailVerified => _emailVerified;
  setEmailVerified(bool val) {
    _emailVerified = val;
  }

  bool _sendButtonLoading = false;
  bool get sendButtonLoading => _sendButtonLoading;
  setSendButtonLoading(bool val) {
    _sendButtonLoading = val;
    notifyListeners();
  }

  bool _createPInLoadining = false;
  bool get createPInLoadining => _createPInLoadining;
  setCreatePInLoadining(bool val) {
    _createPInLoadining = val;
    notifyListeners();
  }

  bool pinFocus = true;
  setPinFocus(bool val) {
    print(val);
    pinFocus = val;
    notifyListeners();
  }

  String? _recipientName;
  String? get recipientName => _recipientName;
  setRecipientName(String? val) {
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
          setRecipientName(
              raw['data']['name'] != null ? raw['data']['name'] : '');
          setEmailVerified(true);
        } else {
          setRecipientName('');
          throw ({'message': 'An error occured'});
        }
      } catch (e) {
        errorHandler(e);
      }

      setLoadingState();
    }
  }

  onSearchChanged() {
    if (emailTextController.value.text.trim().isEmpty) {
      setRecipientName(null);
    } else {
      setRecipientName('Verifying...');
    }
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
      setRecipientName('');
    }
    ;
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      verifyEmail();
    });
  }

  onSendMoneyToGomobileUserClicked(
      BuildContext context, SendMoneyToGomoblieUsersViewmodel model) async {
    if (formKey.currentState!.validate()) {
      await verifyTransaction(context, model);
    } else {}
  }

  verifyTransaction(
      BuildContext context, SendMoneyToGomoblieUsersViewmodel model) async {
    User? user = await getUser();

    showButtomModalSheet(
        context: context,
        child: user!.pin != null
            ? SendMoneyToGomobileUserBottomSheet(model: model)
            : CreatePin(model: model));
  }

  verifyAccount() async {
    try {
      User? user = await getUser();
      http.Response response =
          await _paymentService.verifyAccount({"email": user!.email});
      String? dataAfterResponseHandler = response.body;
      print(dataAfterResponseHandler);
    } catch (e) {
      errorHandler(e);
    }
  }

  proceedToTransferMoneyToGomobileUser() async {
    if (formKey.currentState!.validate() &&
        pinController.text.trim().isNotEmpty) {
      navigationService.back();

      setSendButtonLoading(true);
      var data = {
        "amount": amountController.text.trim(),
        "email": emailTextController.text.trim(),
        "pin": pinController.text.trim()
      };

      http.Response response =
          await _paymentService.sendMoneyToGomobileUser(data);
      String? dataAfterResponseHandler = response.body;
      print(dataAfterResponseHandler);
      var rawData = jsonDecode(dataAfterResponseHandler);

      if (rawData['status']) {
        Alertify(title: 'Success', message: 'Transaction succesful').success();
        refreshUser();
      } else {
        Alertify(title: 'Failed', message: rawData['message']['message']).error();
      }
    }
    setSendButtonLoading(false);
  }

  createPin(context, model) async {
    setCreatePInLoadining(true);

    if (createPinController.text.trim().isNotEmpty) {
      var data = {"pin": createPinController.text.trim()};

      http.Response response = await _paymentService.createPin(data);
      String? dataAfterResponseHandler = response.body;
      print(dataAfterResponseHandler);
      var rawData = jsonDecode(dataAfterResponseHandler);

      if (rawData['status']) {
        navigationService.back();
        verifyTransaction(context, model);
        await refreshUser();
      } else {
        Alertify(title: 'Failed', message: rawData['data']['message']).error();
      }
    }
    setCreatePInLoadining(false);
  }
}
