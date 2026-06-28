import 'package:am3_taller/main.dart';
import 'package:am3_taller/widgets/form/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
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
                onPressed: loading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          try {
                            await login(context, email, password);
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
                    : Text('Iniciar sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> login(
  BuildContext context,
  TextEditingController email,
  TextEditingController password,
) async {
  try {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      password: password.text,
      email: email.text,
    );

    if (res.session != null && res.user != null) {
      if (context.mounted) Navigator.pushNamed(context, '/profiles');
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
