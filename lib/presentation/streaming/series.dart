import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/item.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/grids/custom_grid.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:flutter/material.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Series", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: CustomSizes.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpacer(height: CustomSizes.spaceBtwItems),
              FutureBuilder<List<Item>>(
                future: fetchSeries(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
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
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Item>> fetchSeries() async {
  final data = await supabase.from('items').select().eq('type', 'SERIE');

  return data.map((row) => Item.fromMap(row)).toList();
}
