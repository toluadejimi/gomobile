import 'package:gomobilez/UI/home/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/homePageHeader.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/responsive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) => 
      ResponsiveLayout(
        mobile: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: white,
                ),
              ],
            ),
          ),
        ),
        tab: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                HomePageHeader(model: model),
               ],
            ),
          ),
        ),
        desktop: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
