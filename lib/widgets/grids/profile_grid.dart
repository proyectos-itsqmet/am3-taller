import 'package:am3_taller/utils/constants/profiles_list.dart';
import 'package:flutter/material.dart';

class ProfileGrid extends StatelessWidget {
  const ProfileGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(0),
      children: profiles.map((profile) {
        return TextButton(
          onPressed: () => Navigator.pushNamed(context, '/home'),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Image.asset(
                profile.avatar.url,
                height: 80,
                errorBuilder: (context, error, stackTrace) => Text('error'),
              ),
              Text(
                profile.name,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
