import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});
  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final List<String> images = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
    'assets/image/image4.jpg',
  ];
  List iconsShoes = [
    {
      "id": 1,
      "name": "Tablet",
      "image": "assets/image/tablet.png",
    },
    {
      "id": 2,
      "name": "Camera",
      "image": "assets/image/camera.png",
    },
    {
      "id": 3,
      "name": "Supplement",
      "image": "assets/image/supplement.png",
    },
    {
      "id": 4,
      "name": "Protein Powder",
      "image": "assets/image/protein-powder.png",
    },
    {
      "id": 5,
      "name": "Sport",
      "image": "assets/image/Sport.png",
    },
    {
      "id": 6,
      "name": "Pre-WorkOut",
      "image": "assets/image/pre-workout.png",
    },
    {
      "id": 7,
      "name": "Laptop",
      "image": "assets/image/laptop.png",
    },
    {
      "id": 8,
      "name": "Phone",
      "image": "assets/image/phone.jpg",
    },
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
            ),
            itemBuilder: (context, index, realIdx) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: media.width * 1.5,
                    height: 340,
                  ),
                )),
              );
            },
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Category",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 95,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: iconsShoes.length,
                itemBuilder: (context, index) {
                  var pObj = iconsShoes[index] as Map? ?? {};
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        pObj["image"].toString(),
                        width: 130,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        pObj["name"].toString(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
