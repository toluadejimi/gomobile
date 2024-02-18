
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;

class WebPageViewModel extends AppBaseViewModel {
  WebViewController _controller = WebViewController();
  WebViewController get controller => _controller;

  String? link;

  setController(String url) async {
    if (Platform.isAndroid) {
      link = url;
    }

  }

  init({required String url}) {
    setController(url);
  }

  pop() async {
     navigationService.back();
    navigationService.back();
    refreshUser();
  }

}
