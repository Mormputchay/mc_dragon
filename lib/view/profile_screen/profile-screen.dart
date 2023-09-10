import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/ButtonProfile.dart';
import 'package:mc_dragon/common_widget/text_following.dart';
import 'package:mc_dragon/view/edit_profile/edit_profile.dart';
import 'package:mc_dragon/view/profile_screen/components/profile_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_active_outlined,
                          size: 35,
                          color: Colors.blueAccent,
                        ))
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileImage(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFollowing(title: "Following", subTitle: "0"),
                        SizedBox(width: 35),
                        TextFollowing(title: "Follower", subTitle: "2"),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 17, bottom: 15, top: 15),
                child: Text(
                  "nanaq",
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonProfile(title: "Add Friend", onPress: () {}),
                    ButtonProfile(
                        title: "Edit Profile",
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditProfile()));
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
