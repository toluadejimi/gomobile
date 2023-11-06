
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/services/localStorageService.dart';


class TokenService {
  final LocalStorageService _storageService = locator<LocalStorageService>();

  Future<String?> getToken() async {
    var userJson = await userToken;

    if (userJson == null) {
      return null;
    }

    return userJson;
  }

  Future<bool> setToken(data) async {
    return await _storageService.addStringToStorage(LocalStorageValues.token, data);
  }

  Future<String?> get userToken async {
    var userJson = await _storageService.getStringFromStorage(LocalStorageValues.token);

    if (userJson == null) {
      return null;
    }

    return userJson;
  }
}
