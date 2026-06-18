import 'package:am3_taller/presentation/streaming/favorites.dart';
import 'package:am3_taller/presentation/streaming/home.dart';
import 'package:am3_taller/presentation/streaming/search.dart';
import 'package:am3_taller/widgets/navigations/custom_navigation_bottom_bar.dart';
import 'package:flutter/material.dart';

class StreamingScreen extends StatefulWidget {
  const StreamingScreen({super.key});

  @override
  State<StreamingScreen> createState() => _StreamingScreenState();
}

class _StreamingScreenState extends State<StreamingScreen> {
  int indice = 0;
  List<Widget> paginas = [HomeScreen(), SearchScreen(), FavoritesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        indice: indice,
        onTap: (value) => setState(() {
          indice = value;
        }),
      ),
      body: paginas[indice],
    );
  }
}
