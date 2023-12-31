import '../../../../../../data/utils/export.dart';
import '../../../../widgets/common_text.dart';
import '../../../../widgets/splash_logo.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    controller.decitionMaking();
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const SplashLogo(),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          CommonText('Developed by ${AppInfo.developerName}'),
          CommonText('Version: ${AppInfo.appVersion}'),
        ],
      ),
    );
  }
}
