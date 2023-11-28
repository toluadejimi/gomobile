import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/firebase_options.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/services/firebaseService.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await setupLocator();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseService().initNotifcations();
    runApp(const MyApp());
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            title: 'Gomobilez',
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            theme: ThemeData(
              fontFamily: 'Roboto',
            ),
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            home: child
            // onUnknownRoute: (settings) {
            //   return MaterialPageRoute(builder: (ctx) => const Home());
            // },
            );
      },
      child: EasySplashScreen(
        durationInSeconds: 2,
        navigator: Routes.appBaseScreen,
        logo: Image.asset('assets/images/png/logo.png'),
        backgroundColor: primaryColor,
        logoWidth: 120,
        showLoader: false,
      ),
    );
  }
}
