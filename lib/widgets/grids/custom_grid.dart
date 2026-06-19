import 'package:am3_taller/models/movies.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final List<Movies> movies;

  const CustomGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: CustomSizes.spaceBtwItems,
        crossAxisSpacing: CustomSizes.spaceBtwItems,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        final item = movies[index];

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(image: NetworkImage(item.image)),
          ),
        );
      },
    );
  }
}
