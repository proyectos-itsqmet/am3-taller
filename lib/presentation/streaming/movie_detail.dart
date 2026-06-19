import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final movie = ModalRoute.of(context)!.settings.arguments as Map;
    final item = movies[movie["id"] - 1];

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.laptop_chromebook_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  item.image,
                  height: height * 0.55,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.4),
                          Colors.black,
                        ],
                        stops: const [0.5, 0.85, 1.0],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomSpacer(height: CustomSizes.spaceBtwItems),
                  Row(
                    spacing: CustomSizes.spaceBtwItems,
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.black87,
                          ),
                          label: Text(
                            "Mirar ahora",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),

                      IconButton.filled(
                        onPressed: () {},
                        style: ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white.withValues(alpha: 0.30),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        icon: Icon(Icons.add_rounded, color: Colors.white),
                      ),

                      IconButton.filled(
                        onPressed: () {},
                        style: ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.white.withValues(alpha: 0.30),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        icon: Icon(Icons.download_rounded, color: Colors.white),
                      ),
                    ],
                  ),
                  CustomSpacer(height: CustomSizes.spaceBtwItems),
                  Text(
                    item.description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: CustomSizes.fontSizeSm,
                    ),
                  ),
                  CustomSpacer(height: CustomSizes.spaceBtwItems),
                  Text(
                    "Tambien te puede interesar",
                    style: TextStyle(
                      fontSize: CustomSizes.fontSizeMd,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  CustomSpacer(height: CustomSizes.spaceBtwItems),
                  CustomGrid(movies: movies),
                  CustomSpacer(height: CustomSizes.spaceBtwSections * 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
