import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/item.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/shimmers/cutoms_grid_shimmer.dart';
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
                FutureBuilder(
                  future: fetchFavorites(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CutomsGridShimmer();
                    }

                    if (snapshot.hasData) {
                      final movies = snapshot.data;

                      return CustomGrid(movies: movies!);
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Item>> fetchFavorites() async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return [];

  final List data = await supabase
      .from('items')
      .select(
        'id, name, description, rated, type, release_date, duration, '
        'poster_url, video_url, vote_average, favorites!inner(user_id)',
      )
      .eq('favorites.user_id', userId);

  return data.map((row) => Item.fromJson(row)).toList();
}
