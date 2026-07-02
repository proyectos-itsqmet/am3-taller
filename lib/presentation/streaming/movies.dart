import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/item.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/shimmers/cutoms_grid_shimmer.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Peliculas", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: CustomSizes.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              FutureBuilder<List<Item>>(
                future: fetchMovies(),
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
                  }

                  return const Text("No se encontraron datos");
                },
              ),
              CustomSpacer(height: CustomSizes.spaceBtwSections * 5),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Item>> fetchMovies() async {
  final List data = await supabase.from('items').select().eq('type', 'MOVIE');

  return data.map((row) => Item.fromJson(row)).toList();
}
