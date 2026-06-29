import 'package:am3_taller/main.dart';
import 'package:am3_taller/utils/controller/auth_controller.dart';
import 'package:am3_taller/utils/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController profileName = TextEditingController();
  ProfileController ctrl = Get.put(ProfileController());
  AuthController authCtrl = Get.put(AuthController());

  bool isEnabled = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crear perfil',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 100, 255, 100),
        leading: BackButton(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            children: [
              Obx(() => Image.asset(
                ctrl.profile.value ?? 'assets/avatars/default.png',
                width: 120,
                errorBuilder: (context, error, stackTrace) => Text('no'),
              )),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/choose-profile'),
                child: Text(
                  'Escoge un avatar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: profileName,
                onChanged: (value) {
                  setState(() {
                    isEnabled = value.trim().isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  label: Text('Nombre del perfil'),
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  fillColor: Color(0xFF2A2A2A),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey[700]!, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1.5,
                    ),
                  ),
                  suffixIcon: Icon(Icons.person_2),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      isEnabled
                          ? Color.fromRGBO(0, 100, 255, 100)
                          : Colors.grey[700],
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (!isEnabled) return;
                    try {
                      setState(() {
                        loading = true;
                      });
                      await saveProfile(
                        context,
                        profileName.text,
                        ctrl.profile.value ?? '',
                        authCtrl.user.value!.id,
                      );
                      ctrl.loadProfiles();
                      if (context.mounted) Navigator.pop(context);
                    } catch (e) {
                      SnackBar(content: Text(e.toString()));
                    } finally {
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  child: loading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text('Guardar perfil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> saveProfile(
  BuildContext context,
  String profileName,
  String url,
  String userId,
) async {
  await supabase.from('profiles').insert({
    'user_id': userId,
    'avatar': url,
    'name': profileName,
  });
}
