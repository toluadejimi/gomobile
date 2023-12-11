import 'dart:convert';

import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/saved_cards.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:http/http.dart' as http;

class ManageDebitAndCreditViewmodel extends AppBaseViewModel {
  UserService _userService = locator<UserService>();

  init() {
    fetchSavedCards();
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

  void removeSavedCard(int cardIndex) {
    // connect to endpoint
    notifyListeners();
  }
}
