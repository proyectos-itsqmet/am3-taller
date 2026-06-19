import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(height: height * 0.60),
      items: movies.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(i.image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(CustomSizes.fontSizeMd),
                child: Column(
                  mainAxisAlignment: .end,
                  children: [
                    Text(
                      i.title,
                      style: TextStyle(
                        fontSize: CustomSizes.fontSizeMd,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    FilledButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/movie-detail"),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      child: Text(
                        "Ver ahora",
                        style: TextStyle(color: Colors.blue),
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
  }
}
