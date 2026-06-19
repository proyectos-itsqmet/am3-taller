import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: CustomSizes.md),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Mis favoritos",
                  style: TextStyle(
                    fontSize: CustomSizes.fontSizeMd,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                CustomSpacer(height: CustomSizes.spaceBtwItems),
                CustomGrid(movies: movies),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
