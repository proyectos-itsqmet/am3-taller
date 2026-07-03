import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/user_app.dart';
import 'package:am3_taller/utils/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  Rx<UserApp?> user = Rx<UserApp?>(null);

  Future<void> setUser(String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );
      final data = await supabase
          .rpc('get_user_info', params: {'user_id': res.user?.id})
          .single();
      UserApp userApp = UserApp(
        id: data['id'],
        firstName: data['first_name'],
        lastName: data['last_name'],
        birthday: data['birthday'],
        email: data['email'],
      );
      user.value = userApp;
      Get.offAllNamed('/profiles');
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: e.toString(),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: e.toString(),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    } finally {
      Get.offAllNamed('/');
      Get.delete<ProfileController>();
      Get.delete<AuthController>();
    }
  }
}
