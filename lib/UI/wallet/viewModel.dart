import 'package:flutter/material.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/UI/wallet/bottomSheet.dart';

class WalletViewModel extends DashBoardViewModel {
  TextEditingController amounController = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;
  setLoadingState() {
    _loading = !_loading;
    notifyListeners();
  }

  // proceedToFundWallet() async {
  //   if (amounController.value.text. trim().isNotEmpty) {
  //     setLoadingState();
  //     try {
  //       var data = {
  //         "email": emailTextController.value.text.trim(),
  //         "password": passwordController.value.text.trim()
  //       };
  //       http.Response response = await _authenticationService.login(data);
  //       String? dataAfterResponseHandler = responseHandler(response);

  //       if (dataAfterResponseHandler != null) {
  //         var raw = jsonDecode(dataAfterResponseHandler);

  //         if (raw['status'] == true) {
  //           User user = userFromJson(jsonEncode(raw['data']));

  //           bool success = await _tokenService.setToken(raw['data']['token']);
  //           if (!success) {
  //             throw ('Something went wrong');
  //           }
  //           success = await _localStorageService.addUserToStorage(
  //               LocalStorageValues.user, user);
  //           if (!success) {
  //             throw ('Something went wrong');
  //           }
  //           goToApp();
  //         }
  //       } else {
  //         throw ({'message': 'An error occured'});
  //       }
  //     } catch (e) {
  //       errorHandler(e);
  //     }

  //     setLoadingState();
  //   }
  // }
}
