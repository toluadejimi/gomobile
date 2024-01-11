import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final bool canPop, scrollable;
  final String? title;
  final VoidCallback? onBackPress;
  const CustomScaffold({
    super.key,
    required this.body,
    this.backgroundColor = primaryColor,
    this.title,
    this.canPop = false,
    this.scrollable = true,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: scrollable
              ? BouncingScrollPhysics()
              : NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                canPop || title != null
                    ? Visibility(
                        visible: canPop || title != null,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 20.5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: canPop,
                                child: GestureDetector(
                                  onTap: onBackPress,
                                  child: const Icon(Icons.arrow_back),
                                ),
                              ),
                              Visibility(
                                visible: canPop,
                                child: SizedBox(width: 10.w),
                              ),
                              Visibility(
                                visible: title != null,
                                child: Text(
                                  title!,
                                  style: TextStyle(
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: body,
                ),
                // SizedBox(
                //   height: 100.h,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
