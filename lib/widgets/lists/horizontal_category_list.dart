import 'package:am3_taller/models/categories.dart';
import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryList extends StatelessWidget {
  final List<Categories> categories;

  const HorizontalCategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final List<String> navigators = ["/series", "/movies"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? CustomSizes.md : 0,
              right: index == categories.length - 1 ? CustomSizes.md : 0,
            ),

            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, navigators[index]),
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
              ),
              child: Text(item.title, style: TextStyle(color: Colors.white)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
