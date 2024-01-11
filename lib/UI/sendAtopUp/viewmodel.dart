import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:gomobilez/models/countries.dart';
import 'package:gomobilez/models/serviceProvider.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:gomobilez/services/serviceCost.dart';
import 'package:http/http.dart' as http;

class SendAtopUpViewmodel extends AppBaseViewModel {
  final PaymentService paymentService = locator<PaymentService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController countryController = TextEditingController();
  setCountryController(Object val) async {
    setSelectedCounty(val as Country);
    setSelectedProvider(null);
    setSelectedProduct(null);
    notifyListeners();
    await getServiceProvider(countryFromJson(jsonEncode(val)).code);
  }

  final TextEditingController serviceProviderController =
      TextEditingController();
  setServiceProviderController(Object val) {
    setSelectedProvider(val as ServiceProvider);
    setSelectedProduct(null);
    setServiceProducts([]);
    notifyListeners();
    getServiceProduct(serviceProviderFromJson(jsonEncode(val)).operatorId);
  }

  final TextEditingController serviceProductController =
      TextEditingController();
  setServiceProductController(Object val) {
    setSelectedProduct(val as ServiceProduct);
    notifyListeners();
  }

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  init() {
    getCountries();
  }

  bool _buttonLoadingState = false;
  bool get buttonLoadingState => _buttonLoadingState;
  setButtonLoadingState(bool val) {
    _buttonLoadingState = val;
    notifyListeners();
  }

  bool _countriesLoadingState = false;
  bool get countriesLoadingState => _countriesLoadingState;
  setCountriesLoadingState(bool val) {
    _countriesLoadingState = val;
    notifyListeners();
  }

  bool _serviceProviderLoadingState = false;
  bool get serviceProviderLoadingState => _serviceProviderLoadingState;
  setServiceProviderLoadingState(bool val) {
    _serviceProviderLoadingState = val;
    notifyListeners();
  }

  bool _serviceProductLoadingState = false;
  bool get serviceProductLoadingState => _serviceProductLoadingState;
  setServiceProductLoadingState(bool val) {
    _serviceProductLoadingState = val;
    notifyListeners();
  }

  List<Country> _countryMenuItems = [];
  List<Country> get countryMenuItems => _countryMenuItems;
  setCountryMenuItems(List<Country> data) {
    _countryMenuItems = data;
    notifyListeners();
  }

  Timer? _debounce;

  List<ServiceProvider> _serviceProvider = [];
  List<ServiceProvider> get serviceProvider => _serviceProvider;
  setServiceProvider(List<ServiceProvider> data) {
    _serviceProvider = data;
    notifyListeners();
  }

  List<ServiceProduct> _serviceProducts = [];
  List<ServiceProduct> get serviceProducts => _serviceProducts;
  setServiceProducts(List<ServiceProduct> data) {
    _serviceProducts = data;
    notifyListeners();
  }

  Country? _selectedCountry = null;
  Country? get selectedCountry => _selectedCountry;
  setSelectedCounty(Country val) {
    _selectedCountry = val;
    notifyListeners();
  }

  ServiceProvider? _selectedProvider = null;
  ServiceProvider? get selectedProvider => _selectedProvider;
  setSelectedProvider(ServiceProvider? val) {
    _selectedProvider = val;
    notifyListeners();
  }

  ServiceProduct? _selectedProducts = null;
  ServiceProduct? get selectedProducts => _selectedProducts;
  setSelectedProduct(ServiceProduct? val) {
    _selectedProducts = val;
    notifyListeners();
  }

  onChangeAmount(String? val) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      if (val != null && val.isNotEmpty && _selectedProducts != null) {
        int max = (_selectedProducts!.max * _selectedProducts!.rate).toInt();
        int min = (_selectedProducts!.min * _selectedProducts!.rate).toInt();
        if (int.parse(val) < min) {
          if (min > 0) {
            amountController.text = min.toString();
          } else {
            amountController.text = '1';
          }
        } else if (int.parse(val) > max) {
          amountController.text = max.toString();
        } else {
          amountController.text = val;
        }
        notifyListeners();
      }
    });
  }

  getCountries() async {
    try {
      setCountriesLoadingState(true);
      http.Response response = await paymentService.getCountries();

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

        setCountryMenuItems(countries);
      } else {}
    } catch (e) {
      setCountriesLoadingState(false);
      errorHandler(e);
    }

    setCountriesLoadingState(false);
  }

  getServiceProvider(String code) async {
    try {
      setServiceProviderLoadingState(true);
      var data = {"country_code": code};
      http.Response response = await paymentService.getServiceProvider(data);

      String? dataAfterResponseHandler = response.body;

      var raw = jsonDecode(dataAfterResponseHandler);

      if (raw['status'] == true) {
        List<ServiceProvider> serviceProviders = [];
        print(raw);
        if (raw['data'].length > 0) {
          for (var i = 0; i < raw['data'].length; i++) {
            serviceProviders
                .add(serviceProviderFromJson(jsonEncode(raw['data'][i])));
          }
        }

        setServiceProvider(serviceProviders);
      } else {}
    } catch (e) {
      setServiceProviderLoadingState(false);
      errorHandler(e);
    }

    setServiceProviderLoadingState(false);
  }

  getServiceProduct(String operatorId) async {
    try {
      setServiceProductLoadingState(true);
      var data = {"operator_id": operatorId};
      http.Response response = await paymentService.getServiceProduct(data);

      String? dataAfterResponseHandler = response.body;

      var raw = jsonDecode(dataAfterResponseHandler);

      if (raw['status'] == true) {
        List<ServiceProduct> serviceCosts = [];
        if (raw['data'].length > 0) {
          for (var i = 0; i < raw['data'].length; i++) {
            serviceCosts
                .add(serviceProductFromJson(jsonEncode(raw['data'][i])));
          }
        }

        setServiceProducts(serviceCosts);
      } else {}
    } catch (e) {
      setServiceProductLoadingState(false);
      errorHandler(e);
    }

    setServiceProductLoadingState(false);
  }

  navigateFromContactPage(Contact val) {
    navigationService.back();
    phoneNumberController.text = val.phones[0].normalizedNumber;
    notifyListeners();
  }

  navigateToContactPage() {
    navigationService.navigateToDeviceContactView(
        title: 'Contact', click: navigateFromContactPage);
  }

  buyCredit() async {
    if (selectedCountry != null &&
        selectedProducts != null &&
        selectedProvider != null &&
        (selectedProducts!.fixedPrice.toLowerCase() == 'yes' ||
            amountController.text.isNotEmpty)) {
      setButtonLoadingState(true);
      try {
        var data = {
          "country_code": selectedCountry!.code,
          "service_amount": selectedProducts!.fixedPrice.toLowerCase() == 'no'
              ? amountController.text
              : selectedProducts!.max,
          "phone": phoneNumberController.text,
          "product_id": selectedProducts!.productId,
          "rate": selectedProducts!.rate,
          "operator_id": selectedProvider!.operatorId
        };
        http.Response response = await paymentService.buyAirtime(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          var raw = jsonDecode(dataAfterResponseHandler);

          if (raw['status'] == true) {
            setButtonLoadingState(false);
          }
        } else {
          setButtonLoadingState(false);
        }
      } catch (e) {
        setButtonLoadingState(false);
        errorHandler(e);
      }
    }
    setButtonLoadingState(false);
  }
}
