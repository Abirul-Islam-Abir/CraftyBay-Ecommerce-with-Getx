import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/landing page/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());

  /*runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));*/
}
