import 'package:flutter/material.dart';
import 'package:mc_dragon/view/Shop_Screen/shop_screen.dart';
import 'package:mc_dragon/view/camera_and_video/camera_and_video_screen.dart';
import 'package:mc_dragon/view/home_screen/home_view.dart';
import 'package:mc_dragon/view/more_screen/more_screen.dart';
import 'package:mc_dragon/view/profile_screen/profile-screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});
  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const ShopScreen(),
    const CameraAndVideoScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];
  void _onItemTap(int index) {
    setState(() {
      selectTab = index;
    });
  }

  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectTab),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
        unselectedItemColor: Colors.grey.withOpacity(0.9),
        currentIndex: selectTab,
        onTap: _onItemTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/house.png",
                width: 30,
                height: 25,
                color: selectTab == 0 ? Colors.blueAccent : Colors.grey,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/shopping-cart.png",
                width: 30,
                height: 25,
                color: selectTab == 1 ? Colors.blueAccent : Colors.grey,
              ),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: Container(
                width: 60,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(
                  "assets/image/plus.png",
                  width: 20,
                  height: 20,
                  color: selectTab == 2 ? Colors.white : Colors.black,
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/user.png",
                width: 25,
                height: 30,
                color: selectTab == 3 ? Colors.blueAccent : Colors.grey,
              ),
              label: "Profile"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/app.png",
                width: 30,
                height: 25,
                color: selectTab == 4 ? Colors.blueAccent : Colors.grey,
              ),
              label: "More"),
        ],
      ),
    );
  }
}
