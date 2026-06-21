import 'package:am3_taller/widgets/form/custom_input_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: .min,
          spacing: 20,
          children: [
            CustomInputField(
              label: 'Ingresa tu correo electronico',
              controller: email,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomInputField(
              label: 'Crea una contraseña',
              controller: password,
              isPassword: true,
            ),
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/profiles');
                  }
                },
                child: Text('Iniciar sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
