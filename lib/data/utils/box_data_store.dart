import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class BoxDataStore {
  static String userEmail = '';
  static String userPhoto = '';
  static String userPassword = '';
  static String userName = '';
  static String userMobile = '';
  static String userAddress = '';
  static String userToken = '';
  static String userFcmToken = '';
  static String setCreateProfile = '';
  static bool? isRemember = false;

  BoxDataStore._();
}
