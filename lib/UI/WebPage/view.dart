import 'package:flutter/material.dart';
import 'package:gomobilez/UI/WebPage/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageView extends StatelessWidget {
  final String url;
  const WebPageView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as WebPageViewArguments;
    return ViewModelBuilder<WebPageViewModel>.reactive(
      onViewModelReady: (model) => model.init(url: args.url),
      viewModelBuilder: () => WebPageViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
              child: Stack(
            children: [
              WebViewWidget(controller: model.controller),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: RoundedIconButton(
                    color: transparentWhite,
                    padding: 5,
                    click: () => model.pop(),
                    icon: Icon(Icons.arrow_back)),
              )
            ],
          ))),
    );
  }
}
