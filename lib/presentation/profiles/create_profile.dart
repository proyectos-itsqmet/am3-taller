import 'package:am3_taller/widgets/form/custom_input_field.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController profileName = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crear perfil',
          style: TextStyle(color: Colors.white),
          textAlign: .center,
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
              Image.asset(
                'assets/avatars/default.png',
                width: 120,
                errorBuilder: (context, error, stackTrace) => Text('no'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/choose-profile'),
                child: Text(
                  'Escoge un avatar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              CustomInputField(
                label: 'Nombre del perfil',
                controller: profileName,
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(0, 100, 255, 100),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () => saveProfile(context, profileName.text),
                  child: Text('Guardar perfil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void saveProfile(BuildContext context, String profileName) {
  if (profileName.isEmpty) return;

  Navigator.pop(context);
}
