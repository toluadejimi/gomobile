import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

import '../../../widgets/longButton.dart';

class Success extends StatefulWidget {
  final dynamic Function() close;
  final String message;
  const Success({super.key, required this.close, required this.message});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedIconButton(
            click: () {},
            icon: Icon(
              Icons.info_outline,
              size: 30.sp,
            ),
            color: primaryColor,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            widget.message,
            style: TextStyle(fontSize: 15.sp, color: textGrey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.h,
          ),
          LongButton(
            text: 'ok',
            click: () {
              widget.close();
            },
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
