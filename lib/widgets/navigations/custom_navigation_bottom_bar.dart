import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int indice;
  final Function(int)? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.indice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      currentIndex: indice,
      onTap: onTap,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 24),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      unselectedIconTheme: IconThemeData(color: Colors.white70, size: 22),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoritos"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
    );
  }
}
