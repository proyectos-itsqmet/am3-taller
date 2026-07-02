import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/item.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/lists/horizontal_movies_category_list.dart';
import 'package:am3_taller/widgets/lists/horizontal_movies_list.dart';
import 'package:am3_taller/widgets/shimmers/cutoms_grid_shimmer.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int genre = 12;
  String query = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    setState(() {
      query = value.trim();
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      query = "";
    });
  }

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
                  controller: _searchController,
                  onSubmitted: _onSearchSubmitted,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Buscar...",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: _clearSearch,
                      icon: Icon(Icons.clear_rounded, color: Colors.white),
                    ),
                  ),
                ),
              ),
              HorizontalMoviesCategoryList(
                onPressed: (genreId) => setState(() {
                  genre = genreId;
                }),
              ),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomSizes.md),
                child: FutureBuilder(
                  future: query.isEmpty
                      ? fetchMovies(genre)
                      : searchMovies(query),
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
              ),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontaMovieslList(title: "Ciencia ficción", genre: 10765),
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              HorizontaMovieslList(title: "Comedia", genre: 35),
              CustomSpacer(height: CustomSizes.spaceBtwItems * 5),
            ],
          ),
        ),
      ),
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

Future<List<Item>> searchMovies(String query) async {
  final List data = await supabase
      .from('items')
      .select(
        'id, name, description, rated, type, release_date, duration, '
        'poster_url, video_url, vote_average',
      )
      .ilike('name', '%$query%');

  return data.map((row) => Item.fromJson(row)).toList();
}
