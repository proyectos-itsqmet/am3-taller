import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/item.dart';
import 'package:am3_taller/presentation/streaming/video_player_screen.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/buttons/favorite_button.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/shimmers/cutoms_grid_shimmer.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        // actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.laptop_chromebook_rounded),
        // ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  item.posterUrl ?? "",
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
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomSpacer(height: CustomSizes.spaceBtwItems),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 8,
                    children: [
                      if (item.voteAverage != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.voteAverage!.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: CustomSizes.fontSizeSm,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      if (item.releaseDate != null)
                        Text(
                          '${item.releaseDate!.year}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: CustomSizes.fontSizeSm,
                          ),
                        ),
                      if (item.duration != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              color: Colors.white70,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatRuntime(item.duration!),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: CustomSizes.fontSizeSm,
                              ),
                            ),
                          ],
                        ),
                      if (item.rated != null && item.rated!.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item.rated!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: CustomSizes.fontSizeXs,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (item.genreName != null && item.genreName!.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            item.genreName!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: CustomSizes.fontSizeXs,
                            ),
                          ),
                        ),
                    ],
                  ),
                  CustomSpacer(height: CustomSizes.spaceBtwItems),
                  Row(
                    spacing: CustomSizes.spaceBtwItems,
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: item.videoUrl == null
                              ? null
                              : () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreen(
                                      videoUrl: item.videoUrl!,
                                    ),
                                  ),
                                ),
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

                      FavoriteButton(itemId: item.id),
                      //TODO: Trailer
                      // IconButton.filled(
                      //   onPressed: () {},
                      //   style: ButtonStyle(
                      //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //     backgroundColor: WidgetStatePropertyAll(
                      //       Colors.white.withValues(alpha: 0.30),
                      //     ),
                      //     shape: WidgetStatePropertyAll(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //     ),
                      //   ),
                      //   icon: Icon(Icons.movie_outlined, color: Colors.white),
                      // ),
                    ],
                  ),
                  CustomSpacer(height: CustomSizes.spaceBtwItems),
                  Text(
                    item.description ?? "",
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
                  FutureBuilder(
                    future: fetchItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CutomsGridShimmer();
                      }

                      if (snapshot.hasError) {
                        return Text(
                          snapshot.error.toString(),
                          style: TextStyle(color: Colors.white),
                        );
                      }

                      if (snapshot.hasData) {
                        return CustomGrid(movies: snapshot.data!);
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
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

String _formatRuntime(int minutes) {
  final h = minutes ~/ 60;
  final m = minutes % 60;
  if (h > 0 && m > 0) return '${h}h ${m}min';
  if (h > 0) return '${h}h';
  return '${m}min';
}

Future<List<Item>> fetchItems() async {
  final List data = await supabase.from('items').select().limit(6);

  return data.map((row) => Item.fromJson(row)).toList();
}
