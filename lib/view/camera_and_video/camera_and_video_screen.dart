import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraAndVideoScreen extends StatefulWidget {
  const CameraAndVideoScreen({super.key});
  @override
  State<CameraAndVideoScreen> createState() => _CameraAndVideoScreenState();
}

class _CameraAndVideoScreenState extends State<CameraAndVideoScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

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
      ResolutionPreset.high,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            child: CameraPreview(cameraController),
          )
        ],
      ),
    );
  }
}
