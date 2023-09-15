import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/BuilderAppBar.dart';
import 'package:mc_dragon/data/data_friend.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({super.key});
  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: BuilderAppBar(
        title: "Add Friend",
        color: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: dataFriend.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var pObj = dataFriend[index] as Map? ?? {};
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: double.maxFinite,
                          height: 50,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      pObj["image"].toString(),
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pObj["name"].toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "New York",
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 115,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.grey.shade900,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        pObj["button"].toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
