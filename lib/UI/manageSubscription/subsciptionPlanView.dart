import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/manageSubscription/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class subsciptionPlanView extends StatelessWidget {
  const subsciptionPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageSubscriptionViewModel>.reactive(
      builder: (context, model, child) => CustomScaffold(
        title: 'Subscription',
        canPop: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            BaseText(
              'Combos',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              height: 190.h,
              child: ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) => Expanded(
                  child: Container(
                    height: 93.h,
                    width: 311.w,
                    decoration: ShapeDecoration(
                      color: white36,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 24.h, 5.w, 12.h),
                        child: SvgIconInCircle(
                          svgAssetPath: 'assets/images/svg/ci_bulb.svg',
                          circleSize: 60,
                          circleColor: shadeOfYellow,
                        ),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 18.h, 15.w, 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BaseText(
                                    'Basic Plan',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '\$25/',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10.sp),
                                          text: 'Month',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            BaseText(
                              '• Unlimited Calls to one country (USA)',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: textGrey,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            BaseText(
                              '• 300 SMS / MMS Credit',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Divider(
              color: dividerGrey,
              height: 10.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            BaseText(
              'SMS/ MMS Refill',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 250.h,
              child: ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) => Expanded(
                  child: Container(
                    height: 77.h,
                    width: 311.w,
                    decoration: ShapeDecoration(
                      color: white36,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 24.h, 5.w, 12.h),
                        child: SvgIconInCircle(
                          svgAssetPath: 'assets/images/svg/ci_bulb.svg',
                          circleSize: 50,
                          circleColor: shadeOfYellow,
                        ),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 18.h, 15.w, 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BaseText(
                                    'Basic Plan',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  BaseText(
                                    '\$2',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            BaseText(
                              '• 100 SMS / MMS Credit',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => ManageSubscriptionViewModel(),
    );
  }
}
