import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class HomeWidgetView extends StatelessWidget {
  const HomeWidgetView(
      {super.key,
      required this.asset,
      required this.title,
      required this.description,
      required this.click});
  final String asset;
  final String title;
  final String description;
  final VoidCallback click;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        height: 148.h,
        decoration: ShapeDecoration(
          color: white36,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.sp)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: RoundedIconButton(
                  color: primaryColor,
                  click: () {},
                  icon: SvgPicture.asset(asset),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                child: BaseText(
                  title,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              BaseText(
                description,
                fontSize: 13.sp,
                color: textGrey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
