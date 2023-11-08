extension StringExtensions on String {
  String nameCase() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
