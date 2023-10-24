import 'package:get/get.dart';

import '../../../../../../data/model/6 user profile/read_profile.dart';
import '../../../../../../data/services/6 user profile/read_profile.dart';
import '../../../../../../data/utils/store_data_value.dart';

class ReadProfileScreenController extends GetxController {
  final List<ReadProfileModel> _readProfile = [];

  List<ReadProfileModel> get readProfile => _readProfile;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> fetchAndParseReadProfile() async {
    final response = await readProfileRequest();
    print(response);
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

  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}
