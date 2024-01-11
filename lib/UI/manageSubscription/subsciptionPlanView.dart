import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/manageSubscription/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/plans.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class subsciptionPlanView extends StatelessWidget {
  const subsciptionPlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageSubscriptionViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => CustomScaffold(
        title: 'Subscription',
        canPop: true,
        onBackPress: () => model.navigationService.back(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
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
              height: 200.h,
              child: FutureBuilder(
                  future: model.plans,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.comboPlans.length,
                        itemBuilder: (context, index) {
                          Plan plan = snapshot.data!.comboPlans[index];
                          return GestureDetector(
                            onTap: (){
                              model.onSubscriptionPressed(context, plan, model);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 15.h),
                              decoration: ShapeDecoration(
                                color: white36,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgIconInCircle(
                                      svgAssetPath:
                                          'assets/images/svg/ci_bulb.svg',
                                      circleSize: 50.sp,
                                      circleColor: shadeOfYellow,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BaseText(
                                                plan.title,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              BaseText(
                                                '\$${plan.amount}/month',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          Text(
                                            '${plan.note}',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5.h,
                                              color: textGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      );
                    } else {
                      return BaseText('No Plans Available');
                    }
                  }),
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
              'SMS/MMS/Call Refill ',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 200.h,
              child: FutureBuilder(
                  future: model.plans,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.smsPlan.length +
                            snapshot.data!.callPlan.length,
                        itemBuilder: (context, index) {
                          List<Plan> plans = [
                            ...snapshot.data!.smsPlan,
                            ...snapshot.data!.callPlan
                          ];
                          Plan plan = plans[index];
                          return GestureDetector(
                            onTap: (){
                              model.onSubscriptionPressed(context, plan, model);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 15.h),
                              decoration: ShapeDecoration(
                                color: white36,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgIconInCircle(
                                      svgAssetPath:
                                          'assets/images/svg/ci_bulb.svg',
                                      circleSize: 50.sp,
                                      circleColor: shadeOfYellow,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BaseText(
                                                plan.title,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              BaseText(
                                                '\$${plan.amount}/month',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          Text('${plan.note}',
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5.h,
                                                color: textGrey,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      );
                    } else {
                      return BaseText('No Plans Available');
                    }
                  }),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => ManageSubscriptionViewModel(),
    );
  }
}
