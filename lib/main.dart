import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'modules/landing page/landing_page.dart'; 
Future<void> main() async {
  await appInitialization();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

Future appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}
