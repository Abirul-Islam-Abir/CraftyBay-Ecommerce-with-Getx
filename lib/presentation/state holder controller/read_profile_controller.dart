import 'package:get/get.dart';

import '../../data/model/6 user profile/read_profile_model.dart';
import '../../data/services/6 user profile/read_profile.dart';
import '../../data/utils/box_data_store.dart';

class ReadProfileScreenController extends GetxController {
  bool _isLoading = true;
  final  List<ReadProfileModel> _readProfile = [];
  List<ReadProfileModel> get readProfile => _readProfile;
  bool get isLoading => _isLoading;
  Future<void> fetchAndParseReadProfile() async {
    try {
      final response = await readProfileRequest();
      if (response != null) {
        _readProfile.clear();
        _readProfile.addAll([ReadProfileModel.fromJson(response)]);
        _isLoading = false;
        update();
      }
    } catch (e) {
      throw Exception('Error fetching and parsing data: $e');
    }
  }  Future initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
      fetchAndParseReadProfile(),
      ]);
    } catch (e) {
      throw Exception('Error fetching data :$e');
    } finally {
      _isLoading = false;
      update();
    }
  }
  @override
  void onInit() {
    super.onInit();
    initializeMethod();
  }
}
