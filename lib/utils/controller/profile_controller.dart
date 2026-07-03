import 'dart:io';

import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/profile_model.dart';
import 'package:am3_taller/utils/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  Rx<String?> profile = Rx<String?>(null);
  RxList<ProfileModel> profilesList = <ProfileModel>[].obs;
  Rx<ProfileModel?> activeProfile = Rx<ProfileModel?>(null);
  RxBool isLoading = false.obs;
  RxBool uploadingAvatar = false.obs;

  void setProfile(String profile) {
    this.profile.value = profile;
  }

  void setActiveProfile(ProfileModel profile) {
    activeProfile.value = profile;
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
          id: element['id'].toString(),
          avatar: element['avatar'] ?? '',
          name: element['name'] ?? '',
        );
        profilesList.add(item);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changeAvatar(String filePath) async {
    final ProfileModel? current = activeProfile.value;
    if (current == null) return;

    uploadingAvatar.value = true;
    try {
      final File file = File(filePath);
      final String ext = filePath.contains('.')
          ? filePath.split('.').last
          : 'png';
      final String storagePath = '${current.id}.$ext';

      await supabase.storage
          .from('avatars')
          .upload(
            storagePath,
            file,
            fileOptions: const FileOptions(
              cacheControl: 'no-cache',
              upsert: true,
            ),
          );

      final String publicUrl = supabase.storage
          .from('avatars')
          .getPublicUrl(storagePath);
      // Cache-buster: re-uploading reuses the same path, so the public URL is
      // identical and Image.network would keep showing the stale image.
      final String avatarUrl =
          '$publicUrl?v=${DateTime.now().millisecondsSinceEpoch}';

      await supabase
          .from('profiles')
          .update({'avatar': avatarUrl})
          .eq('id', current.id);

      final ProfileModel updated = current.copyWith(avatar: avatarUrl);
      activeProfile.value = updated;
      final int index = profilesList.indexWhere((p) => p.id == current.id);
      if (index != -1) profilesList[index] = updated;
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: e.toString(),
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
      );
    } finally {
      uploadingAvatar.value = false;
    }
  }
}
