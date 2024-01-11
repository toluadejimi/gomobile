import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class Alertify {
  final String title;
  final String message;
  IconData? icon;
  final Duration duration;
  final VoidCallback? click;
  final Alignment alignment;
  final bool showTrailingIcon;

  Alertify(
      {this.title = "Network Error",
      this.message = "Could not connect to the internet",
      this.icon,
      this.alignment = const Alignment(0, -0.99),
      this.duration = const Duration(seconds: 4),
      this.click = null,
      this.showTrailingIcon = true});

  void success() {
    icon ??= Icons.check;
    botToast(black);
  }

  void notification() {
    icon ??= Icons.message_outlined;
    botToast(black);
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
        size: Size(30.w, 30.h),
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
            size: 18.sp,
          ),
          onPressed: cancel,
        ),
      ),
      title: (_) => Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      subtitle: (_) => Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
      trailing: (cancel) => IconButton(
        icon: Icon(
          showTrailingIcon ? Icons.cancel : Icons.open_in_new,
          color: Colors.white,
          size: 18.sp,
        ),
        onPressed: showTrailingIcon ? cancel : click,
      ),
      onTap: click,
      onLongPress: () {},
      enableSlideOff: true,
      align: alignment,
      backButtonBehavior: BackButtonBehavior.none,
      crossPage: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 7.h,
      ),
      borderRadius: 5.sp,
      onlyOne: false,
      animationDuration: const Duration(milliseconds: 200),
      animationReverseDuration: const Duration(milliseconds: 200),
      duration: duration,
    );
  }
}
