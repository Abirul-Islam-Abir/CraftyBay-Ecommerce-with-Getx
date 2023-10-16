import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_themes.dart';
import '../../../utils/export.dart';
import '../../binding holder/binding_holder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: AppInfo.appName,
          theme: mainTheme(),
          initialBinding: BindingHolder(),
          initialRoute: RouteName.splashScreen,
          getPages: appPages(),
        ),
      );
}
