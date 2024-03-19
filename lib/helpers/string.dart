import 'package:intl/intl.dart';

extension StringExtensions on String {
  String nameCase() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String firstLetter() {
    return "${this[0].toUpperCase()}";
  }

  String standardPhoneNumberFormart() {
    String text = this.trim();
    if (text[0] == '0') {
      text = "+234${substring(1)}";
    }
    return text.replaceAll(' ', '');
  }

  String currencyFormart() {
    double number = double.parse(this.trim());
    var format = NumberFormat.currency(locale: 'en_US');
    String formattedString = format.format(number);

    return formattedString.replaceAll('USD', '');
  }
}

bool isEmpty(String? s) => s == null || s == 'null' || s.trim().isEmpty;

/// Returns [true] if [s] is a not null or empty string.
bool isNotEmpty(String? s) => s != null && s != 'null' && s.trim().isNotEmpty;
