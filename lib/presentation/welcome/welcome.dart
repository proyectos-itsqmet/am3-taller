import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text("Home"),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, "/login"),
              child: Text("Login"),
            ),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, "/register"),
              child: Text("Registro"),
            ),
          ],
        ),
      ),
    );
  }
}
