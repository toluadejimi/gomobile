import 'package:flutter/material.dart';



const Color primaryColor = Color(0xFFFFC700);
const Color iconColor = Color(0x6607F683);
const Color redColor = Color(0xFFFF0000);
const Color white = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF000000);

// Form Error
const String emailValidator =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
final  RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kFileError = "File not accepted";
const String naira = "\u20A6";
