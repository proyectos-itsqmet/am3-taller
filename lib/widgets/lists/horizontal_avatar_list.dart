import 'package:am3_taller/models/avatar.dart';
import 'package:flutter/material.dart';

class HorizontalAvatarList extends StatelessWidget {
  final List<Avatar> avatars;
  final Function(Avatar) onSelected;

  const HorizontalAvatarList({
    super.key,
    required this.avatars,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: avatars.asMap().entries.map((entry) {
          final item = entry.value;

          return IconButton(
            onPressed: () => onSelected(entry.value),
            icon: Image.asset(item.url, width: 80),
          );
        }).toList(),
      ),
    );
  }
}
