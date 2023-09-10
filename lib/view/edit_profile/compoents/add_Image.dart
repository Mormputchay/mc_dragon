import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? pickedImage;

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: ClipOval(
            child: pickedImage != null
                ? Image.file(
                    pickedImage!,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/image/no Image.jpg',
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: Container(
            alignment: Alignment.center,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.blueAccent.shade700,
                borderRadius: BorderRadius.circular(25)),
            child: IconButton(
              onPressed: () {
                openDialog();
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "Selected or take pictures",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(240, 45),
                                backgroundColor:
                                    Colors.white30.withOpacity(0.5)),
                            onPressed: () {
                              pickImage(ImageSource.camera);
                            },
                            icon: const Icon(Icons.camera_alt_rounded),
                            label: const Text(
                              "Camera",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(240, 45),
                                backgroundColor:
                                    Colors.white30.withOpacity(0.5)),
                            onPressed: () {
                              pickImage(ImageSource.gallery);
                            },
                            icon: const Icon(Icons.picture_as_pdf_outlined),
                            label: const Text(
                              "Gallery",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
}
