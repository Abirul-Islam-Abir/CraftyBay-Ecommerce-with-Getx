import 'package:get/get.dart';

import '../../../../../../data/model/6 user profile/read_profile.dart';
import '../../../../../../data/services/6 user profile/read_profile.dart';

class ReadProfileScreenController extends GetxController {
  final List<ReadProfileModel> _readProfile = [];

  List<ReadProfileModel> get readProfile => _readProfile;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> fetchAndParseReadProfile() async {
    List<Map<String, dynamic>> response = await readProfileRequest();
    _readProfile.clear();
    _readProfile.addAll(
      response.map(
            (json) => ReadProfileModel.fromJson(json),
      ),
    );
  }

  Future<void> initializeMethod() async {
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
    initializeMethod();
    super.onInit();
  }
}