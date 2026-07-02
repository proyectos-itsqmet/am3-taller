import 'package:am3_taller/utils/constants/movies_category_list.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalMoviesCategoryList extends StatefulWidget {
  final Function(int genreId)? onPressed;

  const HorizontalMoviesCategoryList({super.key, required this.onPressed});

  @override
  State<HorizontalMoviesCategoryList> createState() =>
      _HorizontalMoviesCategoryListState();
}

class _HorizontalMoviesCategoryListState
    extends State<HorizontalMoviesCategoryList> {
  int selected = 12;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: moviesCategory.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? CustomSizes.md : 0,
              right: index == moviesCategory.length - 1 ? CustomSizes.md : 0,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: selected == index ? 2 : 0,
                  color: selected == index ? Colors.white : Colors.white70,
                ),
              ),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selected = index;
                });
                widget.onPressed?.call(item.id);
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
              ),
              child: Text(
                item.name,
                style: TextStyle(
                  color: selected == index ? Colors.white : Colors.white70,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
