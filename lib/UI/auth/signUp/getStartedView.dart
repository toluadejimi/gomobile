import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/signUp/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/smallButton.dart';

import '../../../helpers/size_config.dart';

class GetStartedView extends StatelessWidget {
  final SignUpViewModel model;
  const GetStartedView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'GOMOBILEZ',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    './assets/images/svg/signup_telephone.svg',
                    semanticsLabel: 'Telephone Image',
                    width: 55,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                'Call and text your family and Friends',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/png/w.png',
                  // semanticsLabel: 'Lady Image',
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SmallButton(
                    text: 'Get Started',
                    click: model.goToNextPage,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
