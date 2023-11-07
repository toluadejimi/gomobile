import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
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
        body:  SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,30.0,0,0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 63,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                              SvgIconInCircle(svgAssetPath: 'assets/images/svg/ci_bulb.svg',),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical:8.0),
                                      child: BaseText('David Kings',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    BaseText('917-1235-2345',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: primaryColor,
                                width: 1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal:8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical:8.0),
                                      child: BaseText('David Kings',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    BaseText('917-1235-2345',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: primaryColor,
                                width: 1,
                              ),
                              SvgPicture.asset('assets/images/svg/solar_phone-calling-outline.svg'),
                              SvgPicture.asset('assets/images/svg/mi_message.svg')
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ],
            ),
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
