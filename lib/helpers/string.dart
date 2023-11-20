extension StringExtensions on String {
  String nameCase() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String firstLetter() {
    return "${this[0].toUpperCase()}";
  }
  String standardPhoneNumberFormart(){
     String text = this.trim();
    if(text[0] == '0'){
      text = "+234${substring(1)}";
    }
   return text.replaceAll(' ', '');

  }
}
