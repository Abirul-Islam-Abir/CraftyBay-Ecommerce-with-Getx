
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'application/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const CraftyBay());

}
