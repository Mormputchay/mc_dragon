import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/BuilderAppBar.dart';
import 'package:mc_dragon/common_widget/MenuButton.dart';
import 'package:mc_dragon/view/Shop_Screen/shop_screen.dart';
import 'package:mc_dragon/view/new_listing/New_listing.dart';

import '../Notification/notification_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});
  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BuilderAppBar(
          title: "Mores",
          centerTitle: true,
          color: Colors.blueAccent.shade700,
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
                icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                  color: Colors.blueAccent.shade700,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      color: Colors.black12,
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        children: [
                          MenuButton(
                            title: "Product",
                            icons: "assets/image/product.png",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NewListingScreen()));
                            },
                          ),
                          MenuButton(
                            title: "Wallet",
                            icons: "assets/image/wallet.png",
                            onPress: () {},
                          ),
                          MenuButton(
                            title: "Wishlist",
                            icons: "assets/image/wishlist.png",
                            onPress: () {},
                          ),
                          MenuButton(
                            title: "Plans",
                            icons: "assets/image/plan.png",
                            onPress: () {},
                          ),
                          MenuButton(
                            title: "Order History",
                            icons: "assets/image/History.png",
                            onPress: () {},
                          ),
                          MenuButton(
                            title: "Product",
                            icons: "assets/image/settings.png",
                            onPress: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Error: An unexpected type error occur!",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/image/coffee.jpg")),
                        MaterialButton(
                          minWidth: 180,
                          height: 45,
                          color: Colors.white60.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ShopScreen()));
                          },
                          child: const Text(
                            "Shop now",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
