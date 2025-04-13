import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:kalakar/controller/payment_controller.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          return Stack(
            children: [
              InAppWebView(
              // initialUrlRequest:
              // URLRequest(url: WebUri(controller.webUrl)),
                initialData: InAppWebViewInitialData(data: controller.iframe),
              initialSettings: controller.settings,
              onWebViewCreated: (ctr) {
                  controller.webViewController = ctr
                  ;
              },
              onLoadStart: (controller, url) {

              },

              shouldOverrideUrlLoading:
                  (controller, navigationAction) async {
                var uri = navigationAction.request.url!;

                if (![
                  "http",
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "about"
                ].contains(uri.scheme)) {
                  // if (await canLaunchUrl(uri)) {
                  //   // Launch the App
                  //   await launchUrl(
                  //     uri,
                  //   );
                  //   // and cancel the request
                  //   return NavigationActionPolicy.CANCEL;
                  // }
                }}),

            ],
          );
        }
      ),
    );
  }
}
