import 'package:flutter/material.dart';
import '../lib2/UI/home.dart';
import '../lib2/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gomobilez',
      theme: ThemeData(),
      routes: routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const HomePage());
      },
    );
  }
}
