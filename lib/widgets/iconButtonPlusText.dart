import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class IconButtonPlusText extends StatelessWidget {
  final double paddingX, paddingY, width, curve;
  final VoidCallback click;
  final Widget? suffixIcon, prefixIcon;
  final Color color;
  final String text;
  const IconButtonPlusText(
      {super.key,
      required this.click,
      this.suffixIcon,
      this.prefixIcon,
      required this.text,
      this.paddingX = 10,
      this.paddingY = 10,
      this.width = 200,
      this.curve = 10,
      this.color = white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        width: width.w,
        padding:
            EdgeInsets.symmetric(vertical: paddingY.h, horizontal: paddingX.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(curve),
          ),
        ),
        child: suffixIcon != null
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(width: 6.w),
                suffixIcon!
              ])
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                prefixIcon!,
                SizedBox(width: 6.w),
                Text(
                  text,
                  style: TextStyle(fontSize: 14.sp),
                )
              ]),
      ),
    );
  }
}
