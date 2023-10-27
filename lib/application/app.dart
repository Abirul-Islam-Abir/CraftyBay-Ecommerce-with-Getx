import 'package:crafty_bay_ecommerce/presentation/network%20connectivity/controller/network_controller.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';
import '../data/utils/export.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});
  @override
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) {
          Get.put(NetworkController());
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: AppInfo.appName,
            theme: mainTheme(),
            initialBinding: StateHolderBinder(),
            initialRoute: RouteName.splashScreen,
            getPages: appPages(),
          );
        },
      );
}
