import 'package:am3_taller/main.dart';
import 'package:am3_taller/widgets/form/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  bool loading = false;

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
              controller: lastName,
            ),
            CustomInputField(
              label: 'Ingresa tus nombres',
              controller: firstName,
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
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  if (_formKey.currentState!.validate() || loading) {
                    try {
                      await register(
                        context,
                        firstName.text,
                        lastName.text,
                        email.text,
                        password.text,
                        birthday.text,
                      );
                    } finally {
                      setState(() {
                        loading = false;
                      });
                    }
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
                    : Text("Completar registro"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> register(
  BuildContext context,
  String firstName,
  String lastName,
  String email,
  String password,
  String birthday,
) async {
  try {
    final AuthResponse res = await supabase.auth.signUp(
      password: password,
      email: email,
    );
    if (res.user != null) {
      await supabase.from('users').insert({
        'id': res.user?.id,
        'last_name': lastName,
        'first_name': firstName,
        'birthday': birthday,
      });
      // Tras registrarse se envía al login para que AuthController se cargue
      // correctamente al iniciar sesión (evita el crash "AuthController not
      // found" que ocurría al ir directo a /profiles).
      Get.offAllNamed('/login');
    }
  } catch (e) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Ocurrio un error: ${e.toString()}'),
        ),
      );
    }
  }
}
