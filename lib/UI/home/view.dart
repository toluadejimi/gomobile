import 'package:gomobilez/UI/home/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
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
      const ResponsiveLayout(
        mobile:  Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Center(
          child: Text('HOME'),
        )),
      ),
        tab:  Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
              child: Center(
            child: Text('HOME'),
          )),
        ),
        desktop:  Scaffold(
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
