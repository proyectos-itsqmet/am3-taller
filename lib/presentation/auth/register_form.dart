import 'package:am3_taller/widgets/form/custom_input_field.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => CustomFormState();
}

class CustomFormState extends State<CustomForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController birthday = TextEditingController();

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
              label: 'Ingresa tus apellidos',
              controller: firstName,
            ),
            CustomInputField(
              label: 'Ingresa tus nombres',
              controller: lastName,
            ),
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
            CustomInputField(
              label: 'Ingresa tu fecha de nacimiento',
              controller: birthday,
              isDate: true,
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
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('¡Éxito!'),
                          content: Text(
                            'Tu cuenta ha sido creada, inicia sesión.',
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/login'),
                              child: Text('Login'),
                            ),
                          ],
                        ),
                      ),
                    },
                },
                child: Text("Completar registro"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
