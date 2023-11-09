import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/auth/getStarted/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/smallButton.dart';
import 'package:stacked/stacked.dart';

class GetStartedView extends StatelessWidget {
 const GetStartedView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<GetStartedViewModel>.reactive(
    
        viewModelBuilder: () => GetStartedViewModel(),
     builder: (context, model, child) => Scaffold(
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
    )
   );
 }
}