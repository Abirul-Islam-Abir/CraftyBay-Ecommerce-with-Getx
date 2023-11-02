
import 'package:crafty_bay_ecommerce/data/utils/storage_key.dart';
import 'package:crafty_bay_ecommerce/data/utils/store_data_value.dart';

class Utils{
 static Future fetchUserData() async {
    final tokenData = await storageInstance.read(StorageKey.setTokenKey);
    final emailData = await storageInstance.read(StorageKey.setEmailKey);
    if (tokenData != null && emailData != null) {
      UserData.userToken = tokenData;
      UserData.userEmail = emailData;
    }
  }
}