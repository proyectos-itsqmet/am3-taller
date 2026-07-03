import 'package:flutter/material.dart';

/// Renders a profile avatar from either a remote URL (an uploaded image) or a
/// bundled asset path, falling back to the default avatar when the source is
/// missing or fails to load.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.avatar, this.height = 80});

  final String? avatar;
  final double height;

  static const String _fallbackAsset = 'assets/avatars/default.png';

  @override
  Widget build(BuildContext context) {
    final String? source = avatar;

    if (source != null && source.startsWith('http')) {
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(shape: BoxShape.circle),
        height: height,
        width: height,
        child: Image.network(
          source,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Image.asset(_fallbackAsset, height: height),
        ),
      );
    }

    if (source != null && source.isNotEmpty) {
      return Image.asset(
        source,
        height: height,
        errorBuilder: (context, error, stackTrace) =>
            Image.asset(_fallbackAsset, height: height),
      );
    }

    return Image.asset(_fallbackAsset, height: height);
  }
}
