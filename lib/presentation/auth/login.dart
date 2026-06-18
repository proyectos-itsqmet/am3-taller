import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text("Login"),
            FilledButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/profiles"),
              child: Text("Iniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
