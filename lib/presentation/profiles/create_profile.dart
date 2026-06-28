import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController profile = TextEditingController();
  bool isEnabled = false;
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
                onPressed: () =>
                    Navigator.pushNamed(context, '/choose-profile'),
                child: Text(
                  'Escoge un avatar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: profile,
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
                  onPressed: () {
                    if (!isEnabled) return;
                    saveProfile(context, profileName.text);
                  },
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

  Navigator.pop(context);
}
