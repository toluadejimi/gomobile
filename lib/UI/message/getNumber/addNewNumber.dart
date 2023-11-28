import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class AddNewNumber extends StatefulWidget {
  final MessageViewModel model;
  const AddNewNumber({super.key, required this.model});

  @override
  State<AddNewNumber> createState() => _AddNewNumberState();
}

class _AddNewNumberState extends State<AddNewNumber> {
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
              Icons.phone_android_rounded,
              size: 30.sp,
            ),
            color: primaryColor,
          ),
          SizedBox(
            height: 14.h,
          ),
          BaseText(
            'Add a New Number',
            fontWeight: FontWeight.bold,
            fontSize: 30.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'You can\'t access this service because you don\'t\nhave an active phone number',
            style: TextStyle(fontSize: 14.sp, color: textGrey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.h,
          ),
          LongButton(
            text: 'Get an active number',
            click: () {
              widget.model.getAnActiveNumber(context, widget.model);
            },
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
