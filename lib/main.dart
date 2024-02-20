import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    await Permission.camera.request();
  await Permission.microphone.request();
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);
    // await FirebaseService().initNotifcations();
    runApp(const MyApp());

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
        logo: Image.asset(
          'assets/images/png/logo.png',
        ),
        backgroundColor: primaryColor,
        logoWidth: 100,
        showLoader: false,
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:gomobilez/UI/WebPage/viewModel.dart';
// import 'package:gomobilez/app/app.router.dart';
// import 'package:gomobilez/helpers/app_colors.dart';
// import 'package:gomobilez/widgets/roundedIconButton.dart';
// import 'package:stacked/stacked.dart';

// class WebPageView extends StatelessWidget {
//   final String url;
//   const WebPageView({Key? key, required this.url}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final args =
//         ModalRoute.of(context)!.settings.arguments as WebPageViewArguments;
//     return ViewModelBuilder<WebPageViewModel>.reactive(
//       onViewModelReady: (model) => model.init(url: args.url),
//       viewModelBuilder: () => WebPageViewModel(),
//       builder: (context, model, child) => Scaffold(
//           backgroundColor: primaryColor,
//           body: SafeArea(
//               child: Stack(
//             children: [
//               InAppWebView(
//                 initialUrlRequest: URLRequest(url: WebUri(model.link.toString())),
//                 initialSettings: InAppWebViewSettings(
//                   allowContentAccess: true,
//                   allowsBackForwardNavigationGestures: true,
//                   mediaPlaybackRequiresUserGesture: false,
//                   allowsInlineMediaPlayback: true
//                     // crossPlatform: InAppWebViewSettings(
//                     //   transparentBackground: true,
//                     //   mediaPlaybackRequiresUserGesture: false,
//                     // ),
//                     // ios: InAppWebViewSettings(
//                     //   allowsInlineMediaPlayback: true,
//                     // )

//                     ),
//                 onPermissionRequest: (controller, request) async {
//                   return PermissionResponse(
//                       resources: request.resources,
//                       action: PermissionResponseAction.GRANT);
//                 },
//                 onLoadStart: (InAppWebViewController controller, Uri? url) {
//                   if (url != null) {
//                     if (url.path == '/home') {
//                       NavigationActionPolicy.CANCEL;
//                       return model.pop();
//                     }
//                   }
//                 },
//                 shouldOverrideUrlLoading: (controller, navigationAction) async {
//                   var uri = navigationAction.request.url!;

//                   print(uri.path);

//                   if (uri.path == '/home') {
//                     NavigationActionPolicy.CANCEL;
//                     return model.pop();
//                   }

//                   return NavigationActionPolicy.CANCEL;
//                 },
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                 child: RoundedIconButton(
//                     color: transparentWhite,
//                     padding: 5,
//                     click: () => model.pop(),
//                     icon: Icon(Icons.arrow_back)),
//               )
//             ],
//           ))),
//     );
//   }
// }