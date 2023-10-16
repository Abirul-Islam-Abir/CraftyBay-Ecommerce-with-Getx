import '../../../../utils/export.dart';
import '../controller/spalsh_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    controller.timerNavigate();
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
