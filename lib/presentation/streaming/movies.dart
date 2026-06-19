import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Peliculas", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: CustomSizes.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              CustomGrid(movies: movies),
            ],
          ),
        ),
      ),
    );
  }
}
