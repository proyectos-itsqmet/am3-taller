import 'package:am3_taller/utils/constants/movies_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CarouselSlider(
          options: CarouselOptions(height: double.infinity),
          items: movies.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(i.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(i.title, style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
