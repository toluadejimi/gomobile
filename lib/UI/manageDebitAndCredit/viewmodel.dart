import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/models/saved_cards.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class ManageDebitAndCreditViewmodel extends BaseViewModel {
  UserService _userService = locator<UserService>();

  List<Info> savedCards = [];
  Future<void> fetchSavedCards() async {
    try {
      http.Response response = await _userService.getSavedCards();

      if (response.statusCode == 200) {
        SavedCards savedCardsResponse = savedCardsFromJson(response.body);
        savedCards = savedCardsResponse.data.info;
        print('Response body: ${savedCards}');
        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Res');
      }
    } catch (error) {
      print('Error during API call: $error'); 
    }
  }
    void removeSavedCard(int cardIndex) {
    savedCards.removeAt(cardIndex);
    notifyListeners();
  }
}
