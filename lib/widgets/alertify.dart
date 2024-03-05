import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Alertify {
  final String title;
  final String message;
  IconData? icon;
  final Alignment alignment;

  Alertify({
    this.title = "Network Error",
    this.message = "Could not connect to the internet",
    this.icon,
    this.alignment = const Alignment(0, -0.99),
  });

  void success() {
    icon ??= Icons.check;
    botToast(Colors.green);
  }

  void warning() {
    icon ??= Icons.warning_amber_rounded;
    botToast(Colors.orangeAccent);
  }

  void error() {
    icon ??= Icons.error_outline;
    botToast(Colors.red);
  }

  botToast(Color bgColor) {
    return BotToast.showNotification(
      backgroundColor: bgColor,
      leading: (cancel) => SizedBox.fromSize(
        size: const Size(40, 40),
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: cancel,
        ),
      ),
      title: (_) => Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: (_) => Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: (cancel) => IconButton(
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
        onPressed: cancel,
      ),
      onTap: () {},
      onLongPress: () {},
      enableSlideOff: true,
      align: alignment,
      backButtonBehavior: BackButtonBehavior.none,
      crossPage: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      onlyOne: false,
      animationDuration: const Duration(milliseconds: 200),
      animationReverseDuration: const Duration(milliseconds: 200),
      duration: const Duration(seconds: 4),
    );
  }
}
