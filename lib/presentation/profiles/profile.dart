import 'package:am3_taller/utils/controller/auth_controller.dart';
import 'package:am3_taller/widgets/grids/profile_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text(
              'Bienvenido ${ctrl.user.value?.firstName}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "¿Quién está viendo?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Selecciona o crea un perfil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            ProfileGrid(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/create-profile'),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(10)),
              ),
              child: Icon(Icons.add, color: Colors.white, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
