import 'package:flutter/material.dart';
import 'package:mc_dragon/data/dataGeneral.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});
  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataGeneral.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var pObj = dataGeneral[index] as Map? ?? {};
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.maxFinite,
                height: 70,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pObj["name"].toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  pObj["date"].toString(),
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.shade300),
                            child: Image.asset(
                              "assets/friend/noimage.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        indent: 4,
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
