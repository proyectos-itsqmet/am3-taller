import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:am3_taller/widgets/spacer/custom_spacer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.60,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 1200),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
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
                        arguments: {"id": i.id},
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
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
  }
}
