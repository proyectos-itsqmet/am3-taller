import 'package:flutter/material.dart';

class ProfileItemMenu extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;

  const ProfileItemMenu({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white)),
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
