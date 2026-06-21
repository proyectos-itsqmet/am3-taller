import 'package:am3_taller/presentation/auth/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(0, 100, 255, 100),
        leading: BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              'Inicia sesión con tu cuenta',
              textAlign: .center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}
