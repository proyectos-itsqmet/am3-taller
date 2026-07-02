import 'package:am3_taller/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CutomsHorizontalListShimmer extends StatelessWidget {
  const CutomsHorizontalListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade600,
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? CustomSizes.md : 0,
                right: index == -1 ? CustomSizes.md : 0,
              ),
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 12),
      ),
    );
  }
}
