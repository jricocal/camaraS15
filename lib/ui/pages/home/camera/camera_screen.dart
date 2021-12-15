import 'package:aplicationcamera/domain/use_cases/controllers/camera_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CamController camState = Get.find<CamController>();
  late Future<void> _initializateControllerFuture;

  @override
  void initState() {
    super.initState();
    camState.controller = CameraController(camState.camera, ResolutionPreset.medium);
    _initializateControllerFuture = camState.controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializateControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          camState.initialized = true;
          return CameraPreview(camState.controller);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      );
  }
}