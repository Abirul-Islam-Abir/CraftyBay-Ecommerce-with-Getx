
import 'package:crafty_bay_ecommerce/data/utils/box_key.dart';
import 'package:crafty_bay_ecommerce/data/utils/box_data_store.dart';

class Utils{
 static Future<void> fetchUserData() async {
    final tokenData = await box.read(BoxKey.setTokenKey);
    final emailData = await box.read(BoxKey.setEmailKey);
    if (tokenData != null && emailData != null) {
      BoxDataStore.userToken = tokenData;
      BoxDataStore.userEmail = emailData;
    }
  }
}