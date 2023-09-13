import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mc_dragon/common_widget/round_button_camera_and_video.dart';
import 'package:mc_dragon/view/camera_and_video/camera_screen.dart';
import 'package:video_player/video_player.dart';

class CameraAndVideoScreen extends StatefulWidget {
  const CameraAndVideoScreen({super.key});
  @override
  State<CameraAndVideoScreen> createState() => _CameraAndVideoScreenState();
}

class _CameraAndVideoScreenState extends State<CameraAndVideoScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  VideoPlayerController? videocontroller;
  bool isRecoring = false;
  int direction = 0;
  File? video;
  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  Future<void> startCamera(int direction) async {
    cameras = await availableCameras();
    WidgetsFlutterBinding.ensureInitialized();
    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.max,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future<void> PickvideoFromGallery() async {
    final videopicked =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (videopicked != null) {
      video = File(videopicked.path);
      videocontroller = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          setState(() {});
          videocontroller!.play();
          videocontroller!.setLooping(true);
        });
    }
  }

  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: media.width,
                height: media.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CameraPreview(cameraController),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 35,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 130,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButtonCameraAndVideo(
                          title: "Camera",
                          isActive: selectTab == 0,
                          onTap: () {
                            setState(() {
                              selectTab = 0;
                            });
                          }),
                      const SizedBox(width: 20),
                      RoundButtonCameraAndVideo(
                          title: "Video",
                          isActive: selectTab == 1,
                          onTap: () {
                            setState(() {
                              selectTab = 1;
                            });
                          }),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => PickvideoFromGallery(),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ClipOval(
                            child: Container(
                              width: 45,
                              height: 45,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () async {
                            setState(() async {
                              if (selectTab == 0) {
                                if (!cameraController.value.isInitialized) {
                                  return;
                                }
                                if (cameraController.value.isTakingPicture) {
                                  return;
                                }
                                try {
                                  cameraController.setFlashMode(FlashMode.auto);
                                  XFile picture =
                                      await cameraController.takePicture();
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ImagePreview(picture)));
                                } on CameraException catch (e) {
                                  debugPrint(
                                      "Error occured while taking picture : $e");
                                  return;
                                }
                              } else {}
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent.shade700, width: 5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: ClipOval(
                              child: Container(
                                width: 60,
                                height: 60,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          direction = direction == 0 ? 1 : 0;
                          startCamera(direction);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ClipOval(
                            child: Container(
                              width: 45,
                              height: 45,
                              color: Colors.black.withOpacity(0.5),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.change_circle_outlined,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
