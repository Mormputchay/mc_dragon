import 'package:flutter/material.dart';

import '../../../data/ButtinType.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ButtonType.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 57,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(23),
                      child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          color: Colors.grey.shade300,
                          child: Text(
                            ButtonType[index],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w400),
                          )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
