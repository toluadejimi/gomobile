import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SendToUpWeView extends StatefulWidget {
  final String url;
  const SendToUpWeView({Key? key, required this.url}) : super(key: key);

  @override
  State<SendToUpWeView> createState() => _SendToUpWeViewState();
}

class _SendToUpWeViewState extends State<SendToUpWeView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // if (url.contains("status")) {
            //   Navigator.pop(context, true);
            // }
            print("NAV onPageFinished ${url}");
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            print("NAV URL ${request.url}");
            if (request.url.contains("home")) {
              Navigator.pop(context, true);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ,
        title: Text('Payment Screen'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
