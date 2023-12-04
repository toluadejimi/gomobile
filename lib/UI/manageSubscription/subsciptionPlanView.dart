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

class subsciptionPlanView extends StatelessWidget {
  const subsciptionPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageSubscriptionViewModel>.reactive(
      builder: (context, model, child) => CustomScaffold(
        title: 'My Subscription',
        canPop: true,
        body: Column(
          children: [
            BaseText(
              'Active Plan',
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              height: 79.h,
              decoration: ShapeDecoration(
                color: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(17.w, 17.h, 23.w, 18.h),
                child: Row(children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/ci_bulb.svg',
                    circleSize: 47,
                    circleColor: shadeOfYellow,
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        'Basic Plan',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: primaryColor,
                        valueColor: AlwaysStoppedAnimation<Color>(black),
                        value: 0.5,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      BaseText(
                        '10/21/2003 - 11/21/2023',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: textGrey,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_sharp,
                        color: red,
                      )),
                ]),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(
                  text: 'Cancel Plan',
                  click: () {},
                  color: red,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  width: 10.w,
                ),
                SmallButton(
                  text: 'Change Plan',
                  click: () {},
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
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                Container(
                  width: 183,
                  height: 71,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(children: [
                    RoundedIconButton(
                      click: () {},
                      icon: Icon(Icons.arrow_upward_outlined),
                      color: red,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      children: [
                        BaseText(
                          'Basic Plan',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 8.h),
                        BaseText(
                          'Expired',
                          fontSize: 10.sp,
                          color: textGrey,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Container(
                  width: 101,
                  height: 71,
                  decoration: ShapeDecoration(
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(children: [
                    RoundedIconButton(
                      click: () {},
                      icon: Icon(Icons.refresh_rounded),
                      color: black,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.w),
                      child: BaseText(
                        'Subscribe again',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, Index) {
                  return Container(
                    height: 79.h,
                    decoration: ShapeDecoration(
                      color: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 17, 23, 18),
                      child: Row(children: [
                        SvgIconInCircle(
                          svgAssetPath:
                              'assets/images/svg/manage_debit_credit.svg',
                          circleSize: 47,
                          circleColor: shadeOfYellow,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              'Jimmy',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            BaseText(
                              '**** **** *** 4142',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                            BaseText(
                              'Exp - 02/2024',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_sharp,
                              color: red,
                            )),
                      ]),
                    ),
                  );
                })
          ],
        ),
      ),
      viewModelBuilder: () => ManageSubscriptionViewModel(),
    );
  }
}
