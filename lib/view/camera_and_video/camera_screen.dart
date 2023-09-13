import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/BuilderAppBar.dart';

class ImagePreview extends StatefulWidget {
  XFile xFile;
  ImagePreview(this.xFile, {super.key});
  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.xFile.path);
    return Scaffold(
      appBar: BuilderAppBar(
        title: "Camera",
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
      body: Center(
        child: Image.file(picture),
      ),
    );
  }
}
