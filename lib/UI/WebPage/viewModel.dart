import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageViewModel extends AppBaseViewModel {
  WebViewController _controller = WebViewController();
  WebViewController get controller => _controller;

  setController(String url) {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(primaryColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          // onPageStarted: (String url) {},
          // onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('home')) {
              NavigationDecision.prevent;
              pop();
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  init({required String url}) {
    setController(url);
  }

  pop() {
    navigationService.back();
  }
}
