import 'dart:convert';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/services/settingsService.dart';
import 'package:http/http.dart'as http;

class LegalTermsViewModel extends AppBaseViewModel {
   SettingsService _settingsService = locator<SettingsService>();

fetchLegalTerms() async {
    try {
      http.Response response = await _settingsService.getLegalTerms();
      var raw = jsonDecode(response.body);

      if (raw['status'] == true) {
        print(raw);
      } else {
        throw {'Error'};
      }
    } catch (error) {
      errorHandler(error);
    }
  }

}
