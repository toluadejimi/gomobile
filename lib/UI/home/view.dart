import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/home/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/greetings.dart';
import 'package:gomobilez/helpers/size_config.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/home_widget.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customIconButton.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/home_widget_view.dart';
import 'package:gomobilez/widgets/iconButtonPlusText.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:gomobilez/widgets/smallButton.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/responsive_layout.dart';

class HomeView extends StatelessWidget {
  final PageController pageController;
  const HomeView({Key? key, required this.pageController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.init(),
      disposeViewModel: false,
      builder: (context, model, child) => ResponsiveLayout(
        tab: const CustomScaffold(
          body: SafeArea(
              child: Center(
            child: Text('HOME'),
          )),
        ),
        mobile: CustomScaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: model.user,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Visibility(
                        visible: snapshot.data!.myPlan != null,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 18.h),
                          decoration: const BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BaseText(
                                    'SMS Credit: ${snapshot.data!.smsCredit} ',
                                    color: white,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: 2.h),
                                  BaseText(
                                    'Your Phone Number',
                                    color: white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 2.h),
                                  Visibility(
                                    visible: snapshot.data!.myPlan != null,
                                    child: BaseText(
                                      'Expires ${snapshot.data!.myPlan != null ? snapshot.data!.myPlan!.expiresAt : 'null'} ',
                                      color: white,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              snapshot.data!.myNumber != null
                                  ? BaseText(
                                      snapshot.data!.myNumber!.phoneNo!,
                                      color: white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    )
                                  : SizedBox(),
                              const SizedBox(
                                width: 3,
                              ),
                              GestureDetector(
                                onTap: () => model.copyTextToClipboard(
                                    snapshot.data!.myNumber!.phoneNo!),
                                child: SvgPicture.asset(
                                  './assets/images/svg/copy_icon.svg',
                                  width: 18.w,
                                  height: 18.h,
                                ),
                              )
                            ],
                          ),
                        ));
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 155.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white, // Change the color as needed
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                ),
                child: Padding(
                  padding: EdgeInsets.all(18.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseText(
                                getGreeting(),
                                fontSize: 14.sp,
                                color: grey,
                              ),
                              SizedBox(height: 2.h),
                              FutureBuilder(
                                  future: model.getUser(),
                                  builder: (ctx, snapshot) {
                                    return snapshot.hasData
                                        ? Text(
                                            snapshot.data!.firstName.nameCase(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold))
                                        : BaseText(
                                            '...',
                                            fontSize: 16.sp,
                                            color: black,
                                          );
                                  }),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => model.navigationService
                                    .navigateToManageSubscriptionView(),
                                child: Row(
                                  children: [
                                    BaseText(
                                      'Subscription',
                                      fontSize: 14.sp,
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
                                        size: 12.sp,
                                        color: black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.0.w),
                                    child: SvgPicture.asset(
                                      './assets/images/svg/home_page_plan_icon.svg',
                                      width: 16.w,
                                    ),
                                  ),
                                  FutureBuilder(
                                      future: model.user,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            '${snapshot.data!.myPlan != null ? snapshot.data!.plans!.where((plan) => plan.id == snapshot.data!.myPlan!.planId).toList()[0].title : "No Active Plan"}',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: black,
                                                fontWeight: FontWeight.bold),
                                          );
                                        } else {
                                          return Text(
                                            '_____',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: black,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      FutureBuilder(
                          future: model.getUser(),
                          builder: (ctx, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.myPlan == null) {
                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: SmallButton(
                                    horizontalPadding: 8.w,
                                    verticalPadding: 4.h,
                                    text: 'Get Subscription',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    click: () => model.navigationService
                                        .navigateToManageSubscriptionView(),
                                    color: primaryColor,
                                  ),
                                );
                              } else {
                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: FutureBuilder(
                                      future:
                                          model.subscriptionProgessWidget(100),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return snapshot.data!;
                                        } else {
                                          return SizedBox();
                                        }
                                      }),
                                );
                              }
                            } else {
                              return SizedBox(
                                height: 20.h,
                              );
                            }
                          }),
                      const SizedBox(
                        height: 7,
                      ),
                      BaseText(
                        'Main Wallet',
                        fontSize: 14.sp,
                        color: grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                './assets/images/svg/solar_wallet-bold.svg',
                                width: 25.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              FutureBuilder(
                                  future: model.getUser(),
                                  builder: (ctx, snapshot) {
                                    if (snapshot.hasData) {
                                      return BaseText(
                                        "\$${snapshot.data!.wallet}",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.w,
                                      );
                                    } else {
                                      return BaseText(
                                        "\$0.00",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.w,
                                      );
                                    }
                                  }),
                            ],
                          ),
                          IconButtonPlusText(
                            curve: 10.sp,
                            paddingY: 8.h,
                            paddingX: 5.w,
                            color: primaryColor,
                            click: () => model.navigateToFundWallet(),
                            prefixIcon: SvgPicture.asset(
                              './assets/images/svg/home_page_fund_wallet_icon.svg',
                              width: 16.sp,
                            ),
                            width: 90.w,
                            text: 'Fund Wallet',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8.0.h),
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 28.0.h, top: 20.h),
                        child: BaseText(
                          'What would you like to do today ?',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // number of items in each row
                            mainAxisSpacing:
                                15.0, // spacing between rows (vertically)
                            crossAxisSpacing:
                                10.0, // spacing between columns (horizontally)
                          ),
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(), // padding around the grid
                          itemCount: model
                              .homeWidgetList.length, // total number of items
                          itemBuilder: (context, index) {
                            final HomeWidget widget =
                                model.homeWidgetList[index];
                            return HomeWidgetView(
                              asset: widget.picture,
                              title: widget.title,
                              description: widget.description,
                              click: () => model.navigate(widget.click),
                            );
                          },
                        ),
                      ),
                      FutureBuilder(
                          future: model.user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Visibility(
                                visible: snapshot.data!.myNumber == null,
                                child: GestureDetector(
                                  onTap: () {
                                    model.reservePhoneNumber(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18.w, vertical: 14.h),
                                    decoration: ShapeDecoration(
                                      color: white36,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                      ),
                                    ),
                                    child: Row(children: [
                                      RoundedIconButton(
                                        padding: 14.w,
                                        color: primaryColor,
                                        click: () {},
                                        icon: SvgPicture.asset(
                                            'assets/images/svg/number.svg'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            BaseText(
                                              'Reserve Phone Number',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            BaseText(
                                              'Rent a phone number to\ncall and text family and friends',
                                              fontSize: 14.sp,
                                              color: textGrey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }),
                      FutureBuilder(
                        future: model.user,
                        builder: (context, snapshot) => snapshot.hasData
                            ? Visibility(
                                visible: snapshot.data!.myPlan == null ||
                                    (snapshot.data!.myPlan != null &&
                                        snapshot.data!.myPlan!.status != 1),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 17.h, bottom: 10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BaseText(
                                        'Subscription',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      GestureDetector(
                                        onTap: () => model.navigationService
                                            .navigateToManageSubscriptionView(),
                                        child: BaseText(
                                          'View All',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ),
                      FutureBuilder(
                          future: model.user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Visibility(
                                visible: snapshot.data!.myPlan == null ||
                                    (snapshot.data!.myPlan != null &&
                                        snapshot.data!.myPlan!.status != 1),
                                child: SizedBox(
                                  height: 90.h,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.plans!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var plan = snapshot.data!.plans![index];
                                        return GestureDetector(
                                          onTap: () =>
                                              {'model.navigateToWeb()'},
                                          child: Container(
                                            width: 285.w,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 18.w,
                                            ),
                                            decoration: ShapeDecoration(
                                              color: veryTransparentWhite,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.w),
                                              ),
                                            ),
                                            child: Row(children: [
                                              RoundedIconButton(
                                                padding: 10.sp,
                                                color: primaryColor,
                                                click: () {},
                                                icon: SvgPicture.asset(
                                                    'assets/images/svg/ci_bulb.svg'),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 200,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        BaseText(
                                                          plan.title!,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                '\$${plan.amount}/',
                                                            style: TextStyle(
                                                                color: black,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            children: [
                                                              TextSpan(
                                                                style: TextStyle(
                                                                    color:
                                                                        black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        10.sp),
                                                                text: 'Month',
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    'Unlimited Calls to your family and friends\nto one country (USA)',
                                                    softWrap: true,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: textGrey,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ]),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: 8.w,
                                        );
                                      }),
                                ),
                              );
                            } else {
                              return Container(
                                color: transparentWhite,
                                height: 50.w,
                                width: 100.h,
                              );
                            }
                          }),
                      FutureBuilder(
                          future: model.user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Visibility(
                                visible: snapshot.data!.myPlan != null,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    BaseText(
                                      'SMS Credit',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return SizedBox();
                            }
                          }),
                      SizedBox(
                        height: 90.h,
                        child: FutureBuilder(
                            future: model.user,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return FutureBuilder(
                                    future: model.plans,
                                    builder: (context, sn) {
                                      if (sn.hasData) {
                                        return Visibility(
                                          visible:
                                              snapshot.data!.myPlan != null,
                                          child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  sn.data!.smsPlan.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var plan =
                                                    sn.data!.smsPlan[index];
                                                return GestureDetector(
                                                  onTap: () =>
                                                      {'model.navigateToWeb()'},
                                                  child: Container(
                                                    width: 285.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 18.w,
                                                    ),
                                                    decoration: ShapeDecoration(
                                                      color:
                                                          veryTransparentWhite,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.w),
                                                      ),
                                                    ),
                                                    child: Row(children: [
                                                      RoundedIconButton(
                                                        padding: 10.sp,
                                                        color: primaryColor,
                                                        click: () {},
                                                        icon: SvgPicture.asset(
                                                            'assets/images/svg/ci_bulb.svg'),
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 200,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                BaseText(
                                                                  plan.title,
                                                                  fontSize:
                                                                      18.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    text:
                                                                        '\$${plan.amount}/',
                                                                    style: TextStyle(
                                                                        color:
                                                                            black,
                                                                        fontSize: 14
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    children: [
                                                                      TextSpan(
                                                                        style: TextStyle(
                                                                            color:
                                                                                black,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize: 10.sp),
                                                                        text:
                                                                            'Month',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 3),
                                                          Text(
                                                            plan.note,
                                                            softWrap: true,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: textGrey,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ]),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return SizedBox(
                                                  width: 8.w,
                                                );
                                              }),
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    });
                              } else {
                                return Container(
                                  color: transparentWhite,
                                  height: 50.w,
                                  width: 100.h,
                                );
                              }
                            }),
                      ),
                      SizedBox(
                        height: 90.h,
                      )
                    ]),
              ),
            ],
          )),
        ),
        desktop: const Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
              child: Center(
            child: Text('HOME'),
          )),
        ),
      ),
    );
  }
}
