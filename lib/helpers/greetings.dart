
// ignore_for_file: dead_code

String getGreeting() {
  var dt = DateTime.now();
  print(dt.hour);
  switch (dt.hour) {
    case < 12:
      return 'Good Morning';
      break;
    case < 17:
      return 'Good Afternoon';
      break;
      case<24:
      return 'Good Evening';
      break;
      default: return 'Hello';
  }
}
