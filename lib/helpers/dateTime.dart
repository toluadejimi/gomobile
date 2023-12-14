import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String getTime() {
    DateTime from = this;
    DateTime to = DateTime.now();
    var diff = (to.difference(from).inHours).round();

    if (diff > 24 && diff < 48) {
      return DateFormat.jm().format(from);
    } else if (diff > 48 && diff < 72) {
      return 'Yesterday';
    } else if (diff > 72 && diff < 240) {
      var diff = (to.difference(from).inDays).round();
      return '${diff} days ago';
    } else {
      return '${from.day}/${from.month}/${from.year}';
    }
  }
}
