import 'package:get/get.dart';

import '../../../../../../data/model/6 user profile/read_profile.dart';
import '../../../../../../data/services/6 user profile/read_profile.dart';
import '../../../../../../data/utils/store_data_value.dart';

class ReadProfileScreenController extends GetxController {
  bool _isLoading = true;
  final List<ReadProfileModel> _readProfile = [];

  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }

  List<ReadProfileModel> get readProfile => _readProfile;

  bool get isLoading => _isLoading;

  Future<void> fetchAndParseReadProfile() async {
    final response = await readProfileRequest();
  }

  Future<void> initializeMethod() async {
    _isLoading = true;
    update();
    try {
      if (UserData.userToken.isNotEmpty) {
        await Future.wait([
          fetchAndParseReadProfile(),
        ]);
      }
    } catch (e) {
      throw Exception('Error fetching data :$e');
    } finally {
      fetchAndParseReadProfile();
      _isLoading = false;
      update();
    }
  }
}
