import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/BuilderAppBar.dart';

class NewListingScreen extends StatefulWidget {
  const NewListingScreen({super.key});
  @override
  State<NewListingScreen> createState() => _NewListingScreenState();
}

class _NewListingScreenState extends State<NewListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BuilderAppBar(
        elevation: 1,
        title: "New Listing",
        color: Colors.blueAccent.shade700,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/image/mc1.png"),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Rith Gaming",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
