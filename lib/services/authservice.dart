
import 'package:gomobilez/helpers/enums/app_states.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/services/index.dart';

class AuthService extends Services {
  //  for authentication, a user is created by default once the user verifies with OAuth
  // but we are using data stored in the user_profile table to run things in the app



  
  Future<bool> signOut() async {
    //sign out endpoint
    bool success = await removeFromStorage(LocalStorageValues.user);
    if (success) {
      await addStringToStorage(
          LocalStorageValues.status, AppStates.unAuthenticated.name);
      return true;
    } else {
      return false;
    }
  }
}
