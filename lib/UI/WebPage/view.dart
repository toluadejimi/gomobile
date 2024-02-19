import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gomobilez/UI/WebPage/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class WebPageView extends StatelessWidget {
  final String url;
  const WebPageView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as WebPageViewArguments;
    return ViewModelBuilder<WebPageViewModel>.reactive(
      onViewModelReady: (model) async => await model.init(url: args.url),
      viewModelBuilder: () => WebPageViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
              child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(model.link.toString())),
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      transparentBackground: true,
                      mediaPlaybackRequiresUserGesture: false,
                    ),
                    ios: IOSInAppWebViewOptions(
                      allowsInlineMediaPlayback: true,
                    )),
                androidOnPermissionRequest: (InAppWebViewController controller,
                    String origin, List<String> resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                },
                onLoadStart: (InAppWebViewController controller, Uri? url) {
                  if (url != null) {
                    if (url.path == '/home') {
                      NavigationActionPolicy.CANCEL;
                      return model.pop();
                    }
                  }
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url!;

                  print(uri.path);

                  if (uri.path == '/home') {
                    NavigationActionPolicy.CANCEL;
                    return model.pop();
                  }

                  return NavigationActionPolicy.CANCEL;
                },
              ),
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
