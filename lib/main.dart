import 'dart:io';

import 'package:crafty_bay_ecommerce/presentation/network%20connectivity/controller/network_controller.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'application/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Platform.isAndroid
      ? runApp(const CraftyBay())
      : runApp(DevicePreview(
          enabled: !kReleaseMode, builder: (context) => const CraftyBay()));
}
