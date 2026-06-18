import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text("Profiles"),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, "/streaming"),
              child: Text("Ingresar"),
            ),
          ],
        ),
      ),
    );
  }
}
