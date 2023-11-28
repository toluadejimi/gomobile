
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  // print('Handling a background message ${message.messageId}');
}

class FirebaseService {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    NavigationService().navigateToMessageView();
    // navigateToConversationView(
    //     phoneNumber: message.data['phone_number'], name: message.data['name']);
  }

  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      Alertify(
              title: notification.title!,
              message: notification.body!,
              click: () => NavigationService().navigateToMessageView(),
              showTrailingIcon: false,
              duration: Duration(seconds: 3))
          .notification();
    });
  }

  Future initNotifcations() async {
    await _firebaseMessaging.requestPermission();

    print(await getToken());

    initPushNotifications();
  }

  Future<String?> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    print('Token: $token');
    return token;
  }
}
