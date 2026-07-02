import 'package:am3_taller/main.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteButton extends StatefulWidget {
  final int itemId;

  const FavoriteButton({super.key, required this.itemId});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late Future<bool> _favoriteFuture;

  @override
  void initState() {
    super.initState();
    _favoriteFuture = isFavorite(widget.itemId);
  }

  Future<bool> _applyToggle(bool isCurrentlyFavorite) async {
    if (isCurrentlyFavorite) {
      await removeFavorite(widget.itemId);
    } else {
      await addFavorite(widget.itemId);
    }
    return isFavorite(widget.itemId);
  }

  void _onPressed(bool isCurrentlyFavorite) {
    setState(() {
      _favoriteFuture = _applyToggle(isCurrentlyFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _favoriteFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade600,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }

        final isFavorite = snapshot.data ?? false;

        return IconButton.filled(
          onPressed: () => _onPressed(isFavorite),
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: WidgetStatePropertyAll(
              Colors.white.withValues(alpha: 0.30),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          icon: Icon(
            isFavorite ? Icons.check_rounded : Icons.add_rounded,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

Future<bool> isFavorite(int itemId) async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return false;

  final data = await supabase
      .from('favorites')
      .select('item_id')
      .eq('user_id', userId)
      .eq('item_id', itemId)
      .limit(1);

  return data.isNotEmpty;
}

Future<void> addFavorite(int itemId) async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return;

  await supabase.from('favorites').insert({
    'user_id': userId,
    'item_id': itemId,
  });
}

Future<void> removeFavorite(int itemId) async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return;

  await supabase
      .from('favorites')
      .delete()
      .eq('user_id', userId)
      .eq('item_id', itemId);
}
