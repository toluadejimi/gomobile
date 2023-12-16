import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';

class CreatePin extends StatefulWidget {
  final SendMoneyToGomoblieUsersViewmodel model;
  const CreatePin({super.key, required this.model});

  @override
  State<CreatePin> createState() => _CreatePin();
}

class _CreatePin extends State<CreatePin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          8.w,
          12.h,
          5.w,
          widget.model.pinFocus
              ? MediaQuery.of(context).viewInsets.bottom
              : 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseText(
            'Create a Transaction Pin',
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
              hintOut: false,
              autofocus: true,
              controller: widget.model.createPinController,
              validator: (val) => widget.model.validateInput(val),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 16.h,
          ),
          LongButton(
              color: black,
              loading: widget.model.createPInLoadining,
              text: 'Continue',
              click: () {
                widget.model.createPin(context, widget.model);
                setState(() {});
              })
        ],
      ),
    );
  }
}
