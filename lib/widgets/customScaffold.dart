import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final bool canPop;
  final String? title;
  final VoidCallback? onBackPress;
  const CustomScaffold({
    super.key,
    required this.body,
    this.backgroundColor = primaryColor,
    this.title,
    this.canPop = false,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
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
                            child: SizedBox(width: 20.w),
                          ),
                          Visibility(
                            visible: title != null,
                            child: Text(
                              title!,
                              style: TextStyle(
                                  fontSize: 23.sp, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
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
    );
  }
}
