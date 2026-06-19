import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/carousel/home_carousel.dart';
import 'package:am3_taller/widgets/lists/horizontal_list.dart';
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
              Text(
                "Streamming App",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeLg,
                  fontWeight: FontWeight.w900,
                ),
              ),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              Text(
                "Menu - Menu - Menu",
                style: TextStyle(
                  fontSize: CustomSizes.fontSizeMd,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HomeCarousel(),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontalList(title: "Lanzamientos", movies: movies),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontalList(title: "Seguir viendo", movies: movies),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontalList(title: "Recomendadas", movies: movies),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
