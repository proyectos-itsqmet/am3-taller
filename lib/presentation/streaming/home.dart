import 'package:am3_taller/utils/constants/categories_list.dart';
import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/carousel/home_carousel.dart';
import 'package:am3_taller/widgets/lists/horizontal_category_list.dart';
import 'package:am3_taller/widgets/lists/horizontal_movies_list.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/logo.png", height: 30),
              HorizontalCategoryList(categories: categories),
              HomeCarousel(),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontaMovieslList(title: "Lanzamientos", movies: movies),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontaMovieslList(title: "Seguir viendo", movies: movies),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontaMovieslList(title: "Recomendadas", movies: movies),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
