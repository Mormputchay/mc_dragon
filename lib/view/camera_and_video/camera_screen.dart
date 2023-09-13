import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ImagePreview extends StatefulWidget {
  XFile xFile;
  ImagePreview(this.xFile, {super.key});
  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  File? video;
  VideoPlayerController? videocontroller;
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.xFile.path);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Camera",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300, maxHeight: 400),
          child: AspectRatio(
            aspectRatio: videocontroller!.value.aspectRatio,
            child: VideoPlayer(videocontroller!),
          ),
        ),
      ),
    );
  }
}
