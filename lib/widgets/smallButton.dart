import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool loading;
  final VoidCallback click;
  final double horizontalPadding, verticalPadding, fontSize;
  final FontWeight fontWeight;
  const SmallButton(
      {required this.text,
      this.color = white,
      this.loading = false,
      required this.click,
      this.horizontalPadding = 42,
      this.verticalPadding = 13,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w700,
      super.key});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            child: LoadingAnimationWidget.inkDrop(
              color: color,
              size: 40.sp,
            ),
          )
        : GestureDetector(
            onTap: () => click(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding.w, vertical: verticalPadding.h),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(10.w))),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fontSize.sp,
                    fontWeight: fontWeight,
                    color: color != black ? black : white),
              ),
            ),
          );
  }
}
