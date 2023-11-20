import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class OnboardingCustomScaffold extends StatelessWidget {
  final List<Widget> body;
  final Widget? decoratedText;
  final Color backgroundColor;
  final bool canPop;
  final String? title, subTitle;
  final VoidCallback? onBackPress;
  const OnboardingCustomScaffold({
    super.key,
    required this.body,
    this.backgroundColor = primaryColor,
    this.title,
    this.subTitle,
    this.canPop = false,
    this.onBackPress,
    this.decoratedText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            canPop || title != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 20.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        canPop
                            ? GestureDetector(
                                onTap: onBackPress,
                                child: const Icon(Icons.arrow_back))
                            : const SizedBox(),
                        const SizedBox(width: 20),
                        title != null
                            ? Text(
                                title!,
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w900),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subTitle != null
                      ? Text(
                          subTitle!,
                          style: TextStyle(fontSize: 15.sp, color: grey),
                        )
                      : const SizedBox(),
                  decoratedText != null ? decoratedText! : const SizedBox(),
                  const SizedBox(
                    height: 70,
                  ),
                  ...body
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
