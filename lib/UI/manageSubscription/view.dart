import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/manageSubscription/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:gomobilez/widgets/smallButton.dart';
import 'package:stacked/stacked.dart';

class ManageSubscriptionView extends StatelessWidget {
  const ManageSubscriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageSubscriptionViewModel>.reactive(
      builder: (context, model, child) => CustomScaffold(
        title: 'My Subscription',
        canPop: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              'Active Plan',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              height: 85,
              decoration: ShapeDecoration(
                color: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(17.w, 16.h, 0, 12.h),
                  child: SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/ci_bulb.svg',
                    circleSize: 57,
                    circleColor: dividerGrey,
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 23.h, 0, 18.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        'Basic Plan',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Container(
                        height: 3.h,
                        width: 182.w,
                        child: LinearProgressIndicator(
                          backgroundColor: primaryColor,
                          valueColor: AlwaysStoppedAnimation<Color>(black),
                          value: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      BaseText(
                        '10/21/2003 - 11/21/2023',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: textGrey,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(
                  horizontalPadding: 16.w,
                  verticalPadding: 10.h,
                  text: 'Cancel Plan',
                  fontSize: 12,
                  click: () {
                    showCupertinoDialog(
                        context: context, builder: createDialog);
                  },
                  color: red,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  width: 10,
                ),
                SmallButton(
                  horizontalPadding: 16.w,
                  verticalPadding: 10.h,
                  text: 'Change Plan',
                  fontSize: 12,
                  click: () {
                    model.navigateToSubsciptionPlanPage();
                  },
                  color: black,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            SizedBox(
              height: 170.h,
            ),
            BaseText(
              'Plan List',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                Container(
                  width: 183.w,
                  height: 80.h,
                  decoration: ShapeDecoration(
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(19, 17, 8, 14),
                      child: RoundedIconButton(
                        click: () {},
                        icon: Icon(
                          Icons.arrow_upward_outlined,
                          color: white,
                        ),
                        color: red,
                        padding: 8,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 24, 0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            'Basic Plan',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 8),
                          BaseText(
                            'Expired',
                            fontSize: 10,
                            color: textGrey,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 80,
                  decoration: ShapeDecoration(
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Column(children: [
                      RoundedIconButton(
                        click: () {},
                        icon: Icon(
                          Icons.refresh_rounded,
                          color: white,
                        ),
                        color: black,
                        padding: 3,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.w),
                        child: BaseText(
                          'Subscribe again',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Container(
                      height: 79,
                      decoration: ShapeDecoration(
                        color: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(19.w, 17.h, 8.w, 14.h),
                          child: RoundedIconButton(
                            click: () {},
                            icon: Icon(
                              Icons.arrow_upward_outlined,
                              color: white,
                            ),
                            color: red,
                            padding: 8,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 22.h, 19.h, 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BaseText(
                                      'Basic Plan',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    BaseText(
                                      '\$20',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BaseText(
                                      '10/21/2003 - 11/21/2023',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: textGrey,
                                    ),
                                    BaseText(
                                      '2/10/2023',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: textGrey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
          ],
        ),
      ),
      viewModelBuilder: () => ManageSubscriptionViewModel(),
    );
  }

  Widget createDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: BaseText(
        'Are you sure you want to\n cancel this plan',
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        CupertinoDialogAction(
          child: BaseText(
            'Yes',
            color: blue,
          ),
          onPressed: () {},
        ),
        CupertinoDialogAction(
          child: BaseText(
            'No',
            color: blue,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
