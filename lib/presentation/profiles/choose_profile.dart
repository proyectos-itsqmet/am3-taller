import 'package:am3_taller/utils/constants/avatars_list.dart';
import 'package:am3_taller/widgets/lists/horizontal_avatar_list.dart';
import 'package:flutter/material.dart';

class ChooseProfile extends StatelessWidget {
  const ChooseProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = avatars.map((a) => a.category).toSet().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escoge un perfil',
          style: TextStyle(color: Colors.white),
          textAlign: .center,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 100, 255, 100),
        leading: BackButton(color: Colors.white),
      ),
      body: Column(
        children: categories.map((category) {
          final items = avatars.where((a) => a.category == category).toList();

          return Column(
            children: [
              Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: .left,
              ),
              HorizontalAvatarList(
                avatars: items,
                onSelected: (val) => {},
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
