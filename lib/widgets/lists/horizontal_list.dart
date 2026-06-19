import 'package:am3_taller/models/movies.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final String title;
  final List<Movies> movies;

  const HorizontalList({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: CustomSizes.md),
          child: Text(
            title,
            style: TextStyle(
              fontSize: CustomSizes.fontSizeMd,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        CustomSpacer(height: CustomSizes.spaceBtwItems),
        SizedBox(
          height: 200,
          child: ListView.separated(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = movies[index];

              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/movie-detail"),
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? CustomSizes.md : 0,
                    right: index == movies.length - 1 ? CustomSizes.md : 0,
                  ),
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: NetworkImage(item.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 12),
          ),
        ),
      ],
    );
  }
}
