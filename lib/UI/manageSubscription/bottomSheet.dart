import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/manageSubscription/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/plans.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/longButton.dart';

class SubscriptionBottomSheet extends StatefulWidget {
  final ManageSubscriptionViewModel model;
  final String title;
  final Plan plan;
  const SubscriptionBottomSheet(
      {super.key,
      required this.model,
      required this.plan,
      required this.title});

  @override
  State<SubscriptionBottomSheet> createState() => _SubscriptionBottomSheet();
}

class _SubscriptionBottomSheet extends State<SubscriptionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.w, 18.h, 5.w, 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseText(
            widget.title,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 15.h,
          ),
          BaseText(
            widget.plan.title,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10.h,
          ),
          BaseText(
            widget.plan.note,
            fontSize: 14.sp,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          BaseText(
            '\$${widget.plan.amount.toString()}',
            fontSize: 42.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 16.h,
          ),
          LongButton(
              color: black,
              text: 'Continue',
              loading: widget.model.subLoading,
              click: () {
                setState(() {
                  widget.title.toLowerCase() == 'resubscribe'
                      ? widget.model.subscribeAgain(widget.plan.id)
                      : widget.model.subscribe(widget.plan.id);
                });
              })
        ],
      ),
    );
  }
}
