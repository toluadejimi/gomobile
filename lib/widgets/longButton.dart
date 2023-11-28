import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LongButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool loading;
  final VoidCallback click;
  final double horizontalPadding, verticalPadding;
  const LongButton(
      {required this.text,
      this.color = white,
      this.loading = false,
      required this.click,
      this.horizontalPadding = 45,
      this.verticalPadding = 14,
      super.key});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: LoadingAnimationWidget.inkDrop(
              color: color,
              size: 40.sp,
            ),
          )
        : GestureDetector(
            onTap: () => click(),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding.w, vertical: verticalPadding.h),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(20.w)),
              ),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: color != black ? black : white),
              ),
            ),
          );
  }
}
