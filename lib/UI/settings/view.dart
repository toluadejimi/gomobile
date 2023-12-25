import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/settings/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => CustomScaffold(
          backgroundColor: primaryColor,
          scrollable: false,
          title: 'Profile',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/profileIcon.svg',
                    circleSize: 70.sp,
                    circleColor: shadeOfYellow,
                    height: 50.h,
                    width: 50.w,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                          future: model.getUser(),
                          builder: (ctx, snapshot) {
                            return snapshot.hasData
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Full Name\n',
                                                style: TextStyle(
                                                    color: textGrey,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)),
                                            TextSpan(
                                              text: snapshot.data!.lastName
                                                      .nameCase() +
                                                  ' ' +
                                                  snapshot.data!.firstName
                                                      .nameCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: black,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Email\n',
                                                style: TextStyle(
                                                    color: textGrey,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)),
                                            TextSpan(
                                                text: snapshot.data!.email,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: black,
                                                    fontSize: 14))
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : const BaseText(
                                    '...',
                                    fontSize: 18,
                                    color: black,
                                  );
                          }),
                    ],
                  ),
                  Spacer(),
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/icon_settings_on.svg',
                    circleSize: 34,
                    circleColor: shadeOfYellow,
                    height: 15.h,
                    width: 15.w,
                    pressed: () {
                      model.navigationService
                          .navigateTo('/update-profile-view');
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/logoutIcon.svg',
                    circleSize: 34,
                    circleColor: shadeOfYellow,
                    height: 15.h,
                    width: 15.w,
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Divider(
                color: grey15,
                height: 3.h,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        model.navigationService
                            .navigateTo
                            (
                              //'/subsciption-plan-view'
                              '/manage-subscription-view'
                              );
                      },
                      child: Container(
                        color: primaryColor,
                        child: Row(
                          children: [
                            SvgIconInCircle(
                              svgAssetPath:
                                  'assets/images/svg/manageSubscription.svg',
                              circleSize: 60.sp,
                              circleColor: shadeOfYellow,
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            BaseText(
                              'Manage Subscription',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Divider(
                      color: dividerGrey,
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        model.navigationService
                            .navigateTo('/manage-debit-and-credit-view');
                      },
                      child: Container(
                        color: primaryColor,
                        child: Row(
                          children: [
                            SvgIconInCircle(
                              svgAssetPath:
                                  'assets/images/svg/manage_debit_credit.svg',
                              circleSize: 60.sp,
                              circleColor: shadeOfYellow,
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            BaseText(
                              'Manage Debit/Credit Card',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Divider(
                      color: dividerGrey,
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        model.navigationService
                            .navigateTo('/update-password-view');
                      },
                      child: Container(
                        color: primaryColor,
                        child: Row(
                          children: [
                            SvgIconInCircle(
                              svgAssetPath:
                                  'assets/images/svg/updatePasswordIcon.svg',
                              circleSize: 60.sp,
                              circleColor: shadeOfYellow,
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            BaseText(
                              'Update Password',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Divider(
                      color: dividerGrey,
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        model.navigationService.navigateTo('/contact-us-view');
                      },
                      child: Container(
                        color: primaryColor,
                        child: Row(
                          children: [
                            SvgIconInCircle(
                              svgAssetPath: 'assets/images/svg/logoutIcon.svg',
                              circleSize: 60.sp,
                              circleColor: shadeOfYellow,
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            BaseText(
                              'Contact us',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Divider(
                      color: dividerGrey,
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        model.navigationService.navigateTo('/legal-terms-view');
                      },
                      child: Container(
                        color: primaryColor,
                        child: Row(
                          children: [
                            SvgIconInCircle(
                              svgAssetPath:
                                  'assets/images/svg/legalTermsIcon.svg',
                              circleSize: 60.sp,
                              circleColor: shadeOfYellow,
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            BaseText(
                              'Legal Terms',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Divider(
                      color: dividerGrey,
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                            context: context, builder: createDialog);
                      },
                      child: Container(
                        color: primaryColor,
                        child: Row(
                          children: [
                            SvgIconInCircle(
                              svgAssetPath:
                                  'assets/images/svg/deleteAccountIcon.svg',
                              circleSize: 60.sp,
                              circleColor: shadeOfYellow,
                              height: 26.h,
                              width: 26.w,
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            BaseText(
                              'Delete Account',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 100.h)
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget createDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: BaseText(
        'Are you sure you want to\n Delete Account',
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      content: BaseText(
        'This action will remove all your\n information on our server, your\n active plan will be deactivated\n with no refund',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
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
