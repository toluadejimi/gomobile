import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/sendMoneyToBank/bottomSheet.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/country_currency_code.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/conversion_rate.dart';
import 'package:gomobilez/models/countries.dart';
import 'package:gomobilez/models/send_money_to_bank.dart';
import 'package:gomobilez/models/user.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'createPinBottomSheet.dart';

class SendMoneyToBankViewmodel extends WalletViewModel {
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

  init() {
    setCountryMenuItems(getCountryCurrencyCode());
    getRecentTransactions();
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
      BuildContext context, SendMoneyToBankViewmodel model) async {
    if (formKey.currentState!.validate()) {
      await verifyTransaction(context, model);
    } else {}
  }

  verifyTransaction(
      BuildContext context, SendMoneyToBankViewmodel model) async {
    User? user = await getUser();

    showButtomModalSheet(
        context: context,
        child: user!.pin != null
            ? SendMoneyToBankBottomSheet(model: model)
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

  proceedToTransferMoneyToBank() async {
    try {
      if (formKey.currentState!.validate() &&
          pinController.text.trim().isNotEmpty &&
          selectedCountry != null) {
        navigationService.back();

        setSendButtonLoading(true);
        var data = {
          "amount": amountController.text.trim(),
          "currency": selectedCountry!.code,
          "pin": pinController.text.trim()
        };

        http.Response response = await _paymentService.sendMoneyToBank(data);
        String? dataAfterResponseHandler = response.body;
        print(dataAfterResponseHandler);
        var rawData = jsonDecode(dataAfterResponseHandler);

        if (rawData['status']) {
          SendMoneyToBank response =
              sendMoneyToBankFromJson(jsonEncode(rawData['data']));
          setSendButtonLoading(false);
          navigationService.navigateToWebPageView(url: response.url);
        } else {
          Alertify(title: 'Failed', message: rawData['data']['message'])
              .error();
          setSendButtonLoading(false);
        }
        setSendButtonLoading(false);
      }
    } catch (e) {
      setSendButtonLoading(false);
      errorHandler(e);
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

  TextEditingController countryController = TextEditingController();
  setCountryController(Object val) async {
    setSelectedCounty(val as Country);
    notifyListeners();
    setSelectedCurrencyRate(null);
    getConversionRate();
  }

  Country? _selectedCountry = null;
  Country? get selectedCountry => _selectedCountry;
  setSelectedCounty(Country val) {
    _selectedCountry = val;
    notifyListeners();
  }

  ConversionRate? _selectedCurrencyRate = null;
  ConversionRate? get selectedCurrencyRate => _selectedCurrencyRate;
  setSelectedCurrencyRate(ConversionRate? val) {
    _selectedCurrencyRate = val;
    notifyListeners();
  }

  bool _countriesLoadingState = false;
  bool get countriesLoadingState => _countriesLoadingState;
  setCountriesLoadingState(bool val) {
    _countriesLoadingState = val;
    notifyListeners();
  }

  bool _conversionRateLoading = false;
  bool get conversionRateLoading => _conversionRateLoading;
  setConversionRateLoading(bool val) {
    _conversionRateLoading = val;
    notifyListeners();
  }

  getCountries() async {
    try {
      setCountriesLoadingState(true);
      http.Response response = await _paymentService.getCountries();

      String? dataAfterResponseHandler = response.body;
      print(dataAfterResponseHandler);

      var raw = jsonDecode(dataAfterResponseHandler);

      if (raw['status'] == true) {
        List<Country> countries = [];
        if (raw['data'].length > 0) {
          for (var i = 0; i < raw['data'].length; i++) {
            countries.add(countryFromJson(jsonEncode(raw['data'][i])));
          }
        }

        setCountryMenuItems(getCountryCurrencyCode());
      } else {}
    } catch (e) {
      setCountriesLoadingState(false);
      errorHandler(e);
    }

    setCountriesLoadingState(false);
  }

  List<Country> _countryMenuItems = [];
  List<Country> get countryMenuItems => _countryMenuItems;
  setCountryMenuItems(List<Country> data) {
    _countryMenuItems = data;
    notifyListeners();
  }

  getConversionRate() async {
    try {
      setConversionRateLoading(true);
      var data = {"currency": selectedCountry!.code};
      http.Response response = await _paymentService.getConversionRate(data);

      String? dataAfterResponseHandler = response.body;
      print(dataAfterResponseHandler);

      var raw = jsonDecode(dataAfterResponseHandler);

      if (raw['status'] == true && raw['data']['conversion_rate'].length>0) {
        ConversionRate rates = conversionRateFromJson(
            jsonEncode(raw['data']['conversion_rate'][0]));

        setSelectedCurrencyRate(rates);
        setConversionRateLoading(false);
      } else {
        setConversionRateLoading(false);
      }
    } catch (e) {
      setConversionRateLoading(false);
      errorHandler(e);
    }

    setCountriesLoadingState(false);
  }

  // List<Country> _countryMenuItems = [];
  // List<Country> get countryMenuItems => _countryMenuItems;
  // setCountryMenuItems(List<Country> data) {
  //   _countryMenuItems = data;
  //   notifyListeners();
  // }
}
