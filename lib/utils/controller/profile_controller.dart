import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/profile_model.dart';
import 'package:am3_taller/utils/controller/auth_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<String?> profile = Rx<String?>(null);
  RxList<ProfileModel> profilesList = <ProfileModel>[].obs;
  RxBool isLoading = false.obs;

  void setProfile(String profile) {
    this.profile.value = profile;
  }

  Future<void> loadProfiles() async {
    isLoading.value = true;
    AuthController ctrl = Get.put(AuthController());

    try {
      final data = await supabase
          .from('profiles')
          .select()
          .eq('user_id', ctrl.user.value!.id);
      profilesList.clear();

      for (var element in data) {
        ProfileModel item = ProfileModel(
          avatar: element['avatar'],
          name: element['name'],
        );
        profilesList.add(item);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
