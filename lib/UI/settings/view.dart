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
          body: Column(
            children: [
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/profileIcon.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                    height: 45.h,
                    width: 45.w,
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
                                                    fontSize: 8)),
                                            TextSpan(
                                              text: snapshot.data!.lastName
                                                      .nameCase() +
                                                  ' ' +
                                                  snapshot.data!.firstName
                                                      .nameCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: black,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Email\n',
                                                style: TextStyle(
                                                    color: textGrey,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8)),
                                            TextSpan(
                                                text: snapshot.data!.email,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: black,
                                                    fontSize: 10))
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
                height: 32,
              ),
              Divider(
                color: dividerGrey,
                height: 3,
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/manageSubscription.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                    height: 26.h,
                    width: 26.w,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BaseText(
                    'Manage Subscription',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                       model.navigationService.navigateTo('/manage-subscription-view');
                    }
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Divider(
                color: dividerGrey,
                height: 3,
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/manage_debit_credit.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                    height: 26.h,
                    width: 26.w,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BaseText(
                    'Manage Debit/Credit Card',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      model.navigationService
                          .navigateTo('/manage-debit-and-credit-view');
                    },
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Divider(
                color: dividerGrey,
                height: 3,
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/updatePasswordIcon.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                    height: 26.h,
                    width: 26.w,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BaseText(
                    'Update Password',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    onPressed: () => model.navigationService
                        .navigateTo('/update-password-view'),
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Divider(
                color: dividerGrey,
                height: 3,
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/logoutIcon.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                    height: 26.h,
                    width: 26.w,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BaseText(
                    'Contact us',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      model.navigationService.navigateTo('/contact-us-view');
                    },
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Divider(
                color: dividerGrey,
                height: 3,
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/legalTermsIcon.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                    height: 26.h,
                    width: 26.w,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BaseText(
                    'Legal Terms',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      model.navigationService.navigateTo('/legal-terms-view');
                    },
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Divider(
                color: dividerGrey,
                height: 3,
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/deleteAccountIcon.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                    height: 26.h,
                    width: 26.w,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BaseText(
                    'Delete Account',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      showCupertinoDialog(
                          context: context, builder: createDialog);
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget createDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: BaseText(
        'Are you sure you want to\n Delete Account',
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      content: BaseText(
        'This action will remove all your\n information on our server, your\n active plan will be deactivated\n with no refund',
        fontSize: 12,
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
