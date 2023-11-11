import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UpdatePasswordViewModel extends BaseViewModel {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  
bool _confirmPasswordState = true;
  bool get confirmPasswordState => _confirmPasswordState;
  setConformPasswordState() {
    _confirmPasswordState = !_confirmPasswordState;
    notifyListeners();
  }
bool _passwordState = true;
bool get passworState => _passwordState;
  setPasswordState() {
    _passwordState = !_passwordState;
    notifyListeners();
  }


  String? validatePasswordInput(String? text) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim().isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }


   String? validatePasswordInput2(String? text, String password1) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim() != password1.trim()) {
      return 'Password don\'t match';
    }
    return null;
  }
}