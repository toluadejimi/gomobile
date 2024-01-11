import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/manageSubscription/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/plans.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customIconButton.dart';
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
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => ManageSubscriptionViewModel(),
      builder: (context, model, child) => CustomScaffold(
        title: 'My Subscription',
        canPop: true,
        onBackPress: () => model.navigationService.back(),
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
            FutureBuilder(
                future: model.user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.myPlan == null ||
                        (snapshot.data!.myPlan != null &&
                            snapshot.data!.myPlan!.status != 1)) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            SvgIconInCircle(
                              svgAssetPath:
                                  'assets/images/svg/manage_debit_credit.svg',
                              circleSize: 60,
                              circleColor: shadeOfYellow,
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(height: 15.h),
                            BaseText(
                              'No Active Plan',
                              fontSize: 16.sp,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SmallButton(
                              horizontalPadding: 16.w,
                              verticalPadding: 10.h,
                              text: 'View All Plan',
                              fontSize: 12,
                              click: () {
                                model.navigateToSubsciptionPlanPage();
                              },
                              color: black,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 16.h),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgIconInCircle(
                                    svgAssetPath:
                                        'assets/images/svg/ci_bulb.svg',
                                    circleSize: 55.sp,
                                    circleColor: dividerGrey,
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          BaseText(
                                            'Active Plan',
                                            fontSize: 16.sp,
                                            color: grey,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          CustomIconButton(
                                            color: primaryColor,
                                            click: () {},
                                            horizontalPadding: 4.w,
                                            verticalPadding: 1.5.h,
                                            radius: 7.sp,
                                            widget: Icon(
                                              Icons.flip_camera_ios_rounded,
                                              size: 14.sp,
                                              color: black,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 5.0.w),
                                            child: SvgPicture.asset(
                                              './assets/images/svg/home_page_plan_icon.svg',
                                              width: 18.w,
                                            ),
                                          ),
                                          FutureBuilder(
                                              future: model.user,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    '${snapshot.data!.myPlan != null ? snapshot.data!.plans!.where((plan) => plan.id == snapshot.data!.myPlan!.planId).toList()[0].title : "No Active Plan"}',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  );
                                                } else {
                                                  return Text(
                                                    '_____',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  );
                                                }
                                              }),
                                        ],
                                      ),
                                      FutureBuilder(
                                          future: model
                                              .subscriptionProgessWidget(200),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return snapshot.data!;
                                            } else {
                                              return SizedBox();
                                            }
                                          }),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 20.h,
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
                                  model.onCancleSubClick(context);
                                },
                                color: red,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SmallButton(
                                horizontalPadding: 16.w,
                                verticalPadding: 10.h,
                                text: 'Change Plan',
                                fontSize: 12.sp,
                                click: () {
                                  model.navigateToSubsciptionPlanPage();
                                },
                                color: black,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ],
                      );
                    }
                  } else {
                    return Container();
                  }
                }),
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
            FutureBuilder(
                future: model.user,
                builder: (context, snapshot) => snapshot.hasData
                    ? Visibility(
                        visible: snapshot.data!.myPlan != null &&
                            snapshot.data!.myPlan!.daysRemaining != null &&
                            snapshot.data!.myPlan!.daysRemaining! > 0,
                        child: Row(
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
                                  child: FutureBuilder(
                                      future: model.getCurrentPlan(),
                                      builder: (context, snapshot) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BaseText(
                                              snapshot.hasData
                                                  ? snapshot.data!.title
                                                  : 'Loading....',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: 8.h),
                                            BaseText(
                                              'Expired',
                                              fontSize: 10.sp,
                                              color: textGrey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        );
                                      }),
                                )
                              ]),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                model.onResubscriptionPressed(context, model);
                              },
                              child: Container(
                                height: 80.h,
                                decoration: ShapeDecoration(
                                  color: white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RoundedIconButton(
                                          click: () {
                                            model.onResubscriptionPressed(
                                                context, model);
                                          },
                                          icon: Icon(
                                            Icons.refresh_rounded,
                                            color: white,
                                          ),
                                          color: black,
                                          padding: 3,
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.w),
                                          child: BaseText(
                                            'Subscribe again',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox()),
            SizedBox(
              height: 11.h,
            ),
            SizedBox(
              height: 220.h,
              child: FutureBuilder(
                  future: model.plans,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.comboPlans.length,
                          itemBuilder: (context, index) {
                            Plan plan = snapshot.data!.comboPlans[index];
                            return GestureDetector(
                              onTap: () {
                                model.onSubscriptionPressed(
                                    context, plan, model);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Container(
                                  height: 79.h,
                                  decoration: ShapeDecoration(
                                    color: white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          19.w, 17.h, 8.w, 14.h),
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
                                        padding: EdgeInsets.fromLTRB(
                                            0, 22.h, 19.h, 20.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BaseText(
                                                  plan.title,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                BaseText(
                                                  '\$${plan.amount}',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 7.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BaseText(
                                                  '${model.dateTimeToDay(DateTime.now())} - ${model.dateTimeToDay(DateTime.now().add(Duration(days: plan.period)))}',
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
                              ),
                            );
                          });
                    } else {
                      return BaseText('No Plans Available');
                    }
                  }),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
