import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UpdateProfileViewModel extends BaseViewModel {
  final GlobalKey<FormState> updateProfileViewFormKey = GlobalKey<FormState>();

  //final PageController pageController = PageController(initialPage: 0);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  
  String? validateInput(String? text) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim().isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? validateEmailInput(String? text) {
    if (text == null) {
      return 'Can\'t be empty';
    }
    if (text.trim().isEmpty) {
      return 'Can\'t be empty';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text.trim())) {
      return 'This is not a valid email';
    }
    return null;
  }
}
