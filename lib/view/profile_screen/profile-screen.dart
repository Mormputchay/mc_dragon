import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/ButtonProfile.dart';
import 'package:mc_dragon/view/edit_profile/edit_profile.dart';
import 'package:mc_dragon/view/profile_screen/components/meun_item.dart';

import '../../common_widget/text_following.dart';
import 'components/profile_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: media.height,
          width: media.width,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_active_outlined,
                          size: 30,
                          color: Colors.blueAccent,
                        ))
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileImage(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFollowing(title: "Following", subTitle: "0"),
                          SizedBox(width: 25),
                          TextFollowing(title: "Follower", subTitle: "2"),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 17, bottom: 15, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "nanaq",
                        style:
                            TextStyle(fontSize: 18, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                            ButtonProfile(title: "Add Friend", onPress: () {})),
                    const SizedBox(width: 25),
                    Expanded(
                      child: ButtonProfile(
                          title: "Edit Profile",
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditProfile()));
                          }),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTabController(
                      length: 8,
                      child: TabBar(
                        onTap: (index) {},
                        isScrollable: true,
                        controller: tabController,
                        tabs: <Widget>[
                          Tab(
                            child: Image.asset("assets/image/menu.png",
                                width: 25,
                                height: 25,
                                color: Colors.blueAccent.shade700),
                          ),
                          Tab(
                            child: Image.asset(
                              "assets/image/favourite.png",
                              width: 25,
                              height: 25,
                              color: Colors.blueAccent.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      MeunItem(),
                      Center(
                        child: Text("My Favorites"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
