import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../data/utils/export.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key, required this.paymentUrl, required this.paymentName});
final String paymentUrl;
final String paymentName;
 late  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(AppColor.kPrimaryColor)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          SnackToast.requestSuccess();
          Get.offAllNamed(RouteName.bottomNavigationBar);
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(paymentUrl));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:   Text('$paymentName Payment')),
      body: WebViewWidget(controller: controller),
    );
  }
}
