import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/sendMoneyToBank/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class SendMoneyToBankBottomSheet extends StatefulWidget {
  final SendMoneyToBankViewmodel model;
  const SendMoneyToBankBottomSheet({super.key, required this.model});

  @override
  State<SendMoneyToBankBottomSheet> createState() =>
      _SendMoneyToBankBottomSheet();
}

class _SendMoneyToBankBottomSheet extends State<SendMoneyToBankBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          5.w,
          12.h,
          5.w,
          widget.model.pinFocus
              ? MediaQuery.of(context).viewInsets.bottom
              : 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseText(
            'Transaction Pin',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 15.h,
          ),
          Focus(
            onFocusChange: (focus) {
              setState(() {
                widget.model.setPinFocus(focus);
              });
            },
            child: InputField(
              hint: 'Transaction Pin',
              fillColor: grey15,
              keyboardType: TextInputType.number,
              hintOut: false,
              autofocus: true,
              controller: widget.model.pinController,
              validator: (val) => widget.model.validateInput(val),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(20.sp)),
                child: Row(
                  children: [
                    RoundedIconButton(
                      padding: 0,
                      click: () {},
                      icon: Icon(
                        Icons.refresh,
                        size: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    BaseText(
                      'Rest Pin',
                      color: white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          LongButton(
              color: black,
              text: 'Continue',
              click: () {
                widget.model.proceedToTransferMoneyToBank();
              })
        ],
      ),
    );
  }
}
