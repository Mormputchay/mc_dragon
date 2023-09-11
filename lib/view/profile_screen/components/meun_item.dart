import 'package:flutter/material.dart';

class MeunItem extends StatefulWidget {
  const MeunItem({super.key});
  @override
  State<MeunItem> createState() => _MeunItemState();
}

class _MeunItemState extends State<MeunItem> {
  // ignore: non_constant_identifier_names
  final List<String> MenuImage = [
    'assets/image/mountain.jpg',
    'assets/image/Snow.jpg',
    'assets/image/formacion-de-la-nieve.jpg',
    'assets/image/white-roses.jpg',
    'assets/image/Snow.jpg',
    'assets/image/formacion-de-la-nieve.jpg',
    'assets/image/white-roses.jpg',
    'assets/image/Snow.jpg',
    'assets/image/formacion-de-la-nieve.jpg',
    'assets/image/white-roses.jpg',
    'assets/image/Snow.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 11,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 115,
              childAspectRatio: 16 / 9,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 130,
              height: 130,
              child: Image.asset(
                MenuImage[index],
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
