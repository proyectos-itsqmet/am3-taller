import 'package:am3_taller/main.dart';
import 'package:am3_taller/models/item.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: fetchMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.hasData) {
          final data = snapshot.data;

          return CarouselSlider(
            options: CarouselOptions(
              height: height * 0.60,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 1200),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: data!.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                        image: NetworkImage(i.posterUrl ?? ""),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(CustomSizes.fontSizeMd),
                      child: Column(
                        mainAxisAlignment: .end,
                        children: [
                          Text(
                            i.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: CustomSizes.fontSizeLg,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          CustomSpacer(height: CustomSizes.sm),
                          FilledButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              "/movie-detail",
                              arguments: i,
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
                            child: Text(
                              "Ver ahora",
                              style: TextStyle(color: Colors.cyan.shade800),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return Text("No se encontraron datos");
        }
      },
    );
  }
}

Future<List<Item>> fetchMovies() async {
  final data = await supabase
      .from('items')
      .select()
      .ilike('video_url', '%supabase%');

  return data.map((row) => Item.fromMap(row)).toList();
}
