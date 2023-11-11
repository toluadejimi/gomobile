import 'package:flutter/cupertino.dart';
import 'package:gomobilez/UI/settings/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/updateProfile/view.dart';
import 'package:gomobilez/helpers/app_colors.dart';
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
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                text: 'Adejinmi Toluwalope',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                    fontSize: 10))
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
                                text: 'davidkings@gmail.com',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                    fontSize: 10))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/icon_settings_on.svg',
                    circleSize: 34,
                    circleColor: shadeOfYellow,
                    pressed: () => model.navigationService
                        .navigateTo('/update-profile-view'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/logoutIcon.svg',
                    circleSize: 34,
                    circleColor: shadeOfYellow,
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
                    svgAssetPath: 'assets/images/svg/profileIcon.svg',
                    circleSize: 60,
                    circleColor: shadeOfYellow,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BaseText(
                    'Manage Subscription',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
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
          child: BaseText('Yes'),
          onPressed: () {},
        ),
        CupertinoDialogAction(
          child: BaseText('No'),
          onPressed: () {},
        ),
      ],
    );
  }
}
