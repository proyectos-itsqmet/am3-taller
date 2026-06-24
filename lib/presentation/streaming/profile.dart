import 'package:am3_taller/presentation/streaming/widgets/profile_item_menu.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(height: CustomSizes.spaceBtwSections),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: .center,
                children: [
                  Image.asset(
                    "assets/avatars/default.png",
                    height: 80,
                    errorBuilder: (context, error, stackTrace) => Text('error'),
                  ),
                  Text(
                    "Perfil 1",
                    style: TextStyle(
                      fontSize: CustomSizes.fontSizeSm,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Cambiar perfil",
                    style: TextStyle(
                      fontSize: CustomSizes.fontSizeXs,
                      color: Colors.white38,
                    ),
                  ),
                ],
              ),
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
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/",
                  (route) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
