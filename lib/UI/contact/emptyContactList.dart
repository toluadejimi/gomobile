import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/widgets/callKeyPad.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class ContactEmptyList extends StatelessWidget {
  final ContactViewModel model;
  const ContactEmptyList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        children: [
          Center(
            child: Text(
              'NO RECENT LIST',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 120.h),
              child: RoundedIconButton(
                click: () => model.showButtomModalSheet(
                    context: context,
                    child: CallKeyPad(
                      call: model.makeCall,
                      click: ()=>model.navigationService.navigateToDeviceContactView(title: "Select Contact", click: model.navigateBackFromContactScreen),
                    ),
                    curve: 0),
                icon: SvgPicture.asset(
                  './assets/images/svg/icon_contact_off.svg',
                  width: 26.w,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
