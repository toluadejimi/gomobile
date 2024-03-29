import 'package:bot_toast/bot_toast.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await setupLocator();
    runApp(const MyApp());
  } catch (e) {
    print(e);
    print('Locator setup has failed');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gomobilez',
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: EasySplashScreen(
        durationInSeconds: 2,
        navigator: Routes.appBaseScreen,
        logo: Image.asset('assets/images/png/logo.png'),
        backgroundColor: primaryColor,
        logoWidth: 120.0,
        showLoader: false,
      ),
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => const Home());
      // },
    );
  }
}
