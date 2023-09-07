import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});
  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/house.png",
                width: 30,
                height: 25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/shopping-cart.png",
                width: 30,
                height: 25,
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
                  color: Colors.white,
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/user.png",
                width: 25,
                height: 30,
              ),
              label: "Profile"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/image/app.png",
                width: 30,
                height: 25,
              ),
              label: "More"),
        ],
      ),
    );
  }
}
