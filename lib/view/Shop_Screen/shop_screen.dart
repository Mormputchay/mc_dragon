import 'package:flutter/material.dart';
import 'package:mc_dragon/view/Notification/notification_screen.dart';
import 'package:mc_dragon/view/Shop_Screen/componets/CategoryScreen.dart';
import 'package:mc_dragon/view/Shop_Screen/componets/items_screen.dart';

import '../../common_widget/BuilderAppBar.dart';
import '../../common_widget/TabTextButton.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int selectTab = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: BuilderAppBar(
        elevation: 0,
        color: Colors.blueAccent.shade700,
        leading: Image.asset(
          "assets/image/mc1.png",
        ),
        title: 'Shop',
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
                  },
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              width: double.maxFinite,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 2),
                    blurRadius: 1,
                  ),
                  //// oxShadow//BoxShadow
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                    hintStyle:
                        const TextStyle(fontSize: 20, color: Colors.grey),
                    prefixIcon: Image.asset(
                      'assets/image/search.png',
                    )),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TabTextButton(
                  image: "assets/image/shopping-bag.png",
                  title: "Items",
                  isActive: selectTab == 0,
                  onPressed: () {
                    setState(() {
                      selectTab = 0;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TabTextButton(
                  image: "assets/image/list.png",
                  title: "category",
                  isActive: selectTab == 1,
                  onPressed: () {
                    setState(() {
                      selectTab = 1;
                    });
                  },
                ),
              ),
            ],
          ),
          if (selectTab == 0) const ItemScreen() else const CategoryScreen()
        ],
      )),
    );
  }
}
