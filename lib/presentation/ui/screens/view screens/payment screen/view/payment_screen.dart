import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../data/utils/export.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key, required this.paymentUrl, required this.paymentName});
final String paymentUrl;
final String paymentName;
 late  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          print(progress);
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
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
