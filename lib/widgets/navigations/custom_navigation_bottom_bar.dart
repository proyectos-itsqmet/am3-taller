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
      currentIndex: indice,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoritos"),
      ],
    );
  }
}
