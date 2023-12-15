import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/user.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';

class SendMoneyToGomoblieUsersViewmodel extends WalletViewModel {
  PaymentService _paymentService = locator<PaymentService>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final LocalAuthentication _bioMetricsAuth = LocalAuthentication();
  final _localStorageService = locator<LocalStorageService>();

  bool _emailVerified = false;
  Timer? _debounce;
  bool get emailVerified => _emailVerified;
  setEmailVerified(bool val) {
    _emailVerified = val;
  }

  bool _sendButtonLoading = false;
  bool get sendButtonLoading => _sendButtonLoading;
  setSendButtonLoading(bool val){
    _sendButtonLoading = val;
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
    };
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      verifyEmail();
    });
  }

  onSendMoneyToGomobileUserClicked(BuildContext context) async {
    setSendButtonLoading(true);
    if(amountController.text.isNotEmpty && emailTextController.text.isNotEmpty){

    bool verified = await verifyTransaction(context);
    }
  }


    verifyTransaction(BuildContext context ) async {
    try {
      // final bool canAuthenticateWithBiometrics =
      //     await _bioMetricsAuth.canCheckBiometrics;

      // if (canAuthenticateWithBiometrics) {
        bool isAuthenticated = await _bioMetricsAuth.authenticate(
            localizedReason:
                'Authenticate to send money', // Displayed to the user
            options: const AuthenticationOptions(
                biometricOnly: false, sensitiveTransaction: true, useErrorDialogs: true, stickyAuth: true));

        if (isAuthenticated) {
          Map<String, dynamic>? authCredentials =
              await _localStorageService.getAuthCredentialsFromStorage();
          if (authCredentials != null) {
            // verifyAccountEmailTextController.text = authCredentials['email'];
            // verifyAccountPasswordController.text = authCredentials['password'];
            return true;
          } else {
            showButtomModalSheet(context: context, child: Container());
          }
        } else {
          Alertify(title: "Failed", message: 'Verification Failed').error();
          return false;
        }
      // } else {
      // }
    } catch (e) {
      Alertify(title: "Fialed", message: "Error authenticating").error();
      return false;
    }
  }


  verifyAccount() async {
    try {
    User? user = await getUser();
     http.Response response = await _paymentService.verifyAccount({"email": user!.email});
     String? dataAfterResponseHandler = response.body;
     print(dataAfterResponseHandler);
    }catch(e){
       errorHandler(e);
    }

  }

  _proceedToTransferMoneyToGomobileUser() async {
    if (amounController.value.text.trim().isNotEmpty &&
        vendor.name.isNotEmpty) {
      setLoadingState();
      try {
        var data = {
          "amount": int.parse(amounController.value.text.trim()),
          "vendor": vendor.name
        };
        http.Response response = await _paymentService.sendMoneyToGomobileUser(data);
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
