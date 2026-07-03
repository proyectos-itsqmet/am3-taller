import 'package:am3_taller/presentation/streaming/widgets/profile_item_menu.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/utils/controller/auth_controller.dart';
import 'package:am3_taller/utils/controller/profile_controller.dart';
import 'package:am3_taller/widgets/images/profile_avatar.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _pickFrom(ProfileController ctrl, ImageSource source) async {
    final XFile? picked = await ImagePicker().pickImage(
      source: source,
      imageQuality: 70,
    );
    if (picked == null) return;
    await ctrl.changeAvatar(picked.path);
  }

  void _showSourcePicker(BuildContext context, ProfileController ctrl) {
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text("Galería"),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _pickFrom(ctrl, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: const Text("Cámara"),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _pickFrom(ctrl, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController ctrl = Get.find<ProfileController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(height: CustomSizes.spaceBtwSections),
              Obx(() {
                final profile = ctrl.activeProfile.value;
                final bool uploading = ctrl.uploadingAvatar.value;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: uploading
                          ? null
                          : () => _showSourcePicker(context, ctrl),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ProfileAvatar(avatar: profile?.avatar, height: 80),
                          if (uploading)
                            const SizedBox(
                              height: 80,
                              width: 80,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          else
                            const Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.black54,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      profile?.name ?? "Perfil",
                      style: TextStyle(
                        fontSize: CustomSizes.fontSizeSm,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Cambiar imagen",
                      style: TextStyle(
                        fontSize: CustomSizes.fontSizeXs,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                );
              }),
              CustomSpacer(height: CustomSizes.spaceBtwSections),
              ProfileItemMenu(
                title: "Cuenta",
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pushNamed(context, "/account"),
              ),
              ProfileItemMenu(
                title: "Términos de uso",
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pushNamed(context, "/terms"),
              ),
              ProfileItemMenu(
                title: "Asistencia",
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pushNamed(context, "/contact"),
              ),
              Divider(
                indent: CustomSizes.md,
                endIndent: CustomSizes.md,
                color: Colors.white30,
              ),
              ProfileItemMenu(
                title: "Cerrar sesión",
                leading: Icon(Icons.logout, color: Colors.white),
                onTap: () => Get.find<AuthController>().logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
