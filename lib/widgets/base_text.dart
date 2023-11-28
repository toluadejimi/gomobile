import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final VoidCallback? onPressed;
  final TextAlign? textAlign;
  const BaseText(
    this.text, {
    super.key,
    this.fontSize = 12,
    this.fontWeight,
    this.color,
    this.onPressed,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize!.sp,
          fontWeight: fontWeight,
          fontFamily: 'inter',
          color: color,
        ),
      ),
    );
  }
}
