import 'package:am3_taller/utils/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileGrid extends StatelessWidget {
  const ProfileGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfilesList();
  }
}

class ProfilesList extends StatefulWidget {
  const ProfilesList({super.key});

  @override
  State<ProfilesList> createState() => _ProfilesListState();
}

class _ProfilesListState extends State<ProfilesList> {
  final ProfileController ctrl = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    ctrl.loadProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.isLoading.value) {
        return CircularProgressIndicator();
      }
      if (ctrl.profilesList.isNotEmpty) {
        return GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(0),
          children: ctrl.profilesList.map((profile) {
            return TextButton(
              onPressed: () => Navigator.pushNamed(context, '/streaming'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    profile.avatar,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/avatars/default.png", height: 80),
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
      } else {
        return Text('No existen perfiles');
      }
    });
  }
}
