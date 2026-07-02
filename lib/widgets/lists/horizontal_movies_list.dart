import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/item.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/shimmers/cutoms_horizontal_list_shimmer.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class HorizontaMovieslList extends StatelessWidget {
  final String title;
  final int genre;

  const HorizontaMovieslList({
    super.key,
    required this.title,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMovies(genre),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
                    color: Colors.white,
                  ),
                ),
              ),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              SizedBox(height: 200, child: CutomsHorizontalListShimmer()),
            ],
          );
        }

        if (snapshot.hasData) {
          final movies = snapshot.data;
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
                    color: Colors.white,
                  ),
                ),
              ),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: movies!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = movies[index];

                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        "/movie-detail",
                        arguments: item,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: index == 0 ? CustomSizes.md : 0,
                          right: index == movies.length - 1
                              ? CustomSizes.md
                              : 0,
                        ),
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image: NetworkImage(item.posterUrl ?? ""),
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
        } else {
          return SizedBox();
        }
      },
    );
  }
}

Future<List<Item>> fetchMovies(int genre) async {
  final List data = await supabase
      .from('items')
      .select(
        'id, name, description, rated, type, release_date, duration, '
        'poster_url, video_url, vote_average, item_genres!inner(genre_id)',
      )
      .eq('item_genres.genre_id', genre);

  return data.map((row) => Item.fromJson(row)).toList();
}
