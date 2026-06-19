import 'package:am3_taller/utils/constants/movies_category_list.dart';
import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/lists/horizontal_movies_category_list.dart';
import 'package:am3_taller/widgets/lists/horizontal_movies_list.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white12),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Buscar...",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.clear_rounded, color: Colors.white),
                    ),
                  ),
                ),
              ),
              HorizontalMoviesCategoryList(categories: moviesCategory),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontaMovieslList(title: "Tendencias", movies: movies),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontaMovieslList(title: "Recomendado", movies: movies),
            ],
          ),
        ),
      ),
    );
  }
}
