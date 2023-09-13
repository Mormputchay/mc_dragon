import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mc_dragon/data/dataproduct.dart';
import 'package:mc_dragon/view/Shop_Screen/componets/text_Product.dart';

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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                TextProduct(title: "Product", onPress: () {}),
                const SizedBox(height: 15),
                GridView.builder(
                    itemCount: dataProduct.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 250),
                    itemBuilder: (context, index) {
                      var pObj = dataProduct[index] as Map? ?? {};
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      pObj["image"].toString(),
                                      height: 150,
                                      width: double.maxFinite,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        pObj["name"].toString(),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                      const SizedBox(height: 2),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              pObj["price"].toString(),
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: ClipOval(
                                                child: Container(
                                                  width: 33,
                                                  height: 33,
                                                  alignment: Alignment.center,
                                                  color: Colors.blue.shade700,
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 25,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
