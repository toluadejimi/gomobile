import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:gomobilez/widgets/recentCallBox.dart';
import 'package:stacked/stacked.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => ContactViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) =>
                        const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: RecentCallBox()),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 100),
          child: FloatingActionButton(
            backgroundColor: white,
            onPressed: () {},
            child: const SvgIconInCircle(
              svgAssetPath: 'assets/images/svg/mdi_keypad.svg',
              circleColor: white,
            ),
          ),
        ),
      ),
    );
  }
}
