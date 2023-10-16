import 'package:get_storage/get_storage.dart';

final storageInstance = GetStorage();

class UserData {
  static String userEmail = '';
  static String userPhoto = '';
  static String userPassword = '';
  static String userName = '';
  static String userMobile = '';
  static String userAddress = '';
  static String userToken = '';
  static String userFcmToken = '';
  static bool? isRemember = false;
  UserData._();
}
