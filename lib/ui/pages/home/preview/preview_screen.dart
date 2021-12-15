import 'dart:io';

import 'package:aplicationcamera/domain/use_cases/controllers/camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final CamController camState = Get.find<CamController>();
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        if (camState.picturePath.isNotEmpty) {
          return Image.file(File(camState.picturePath));
        } else {
          return const CircularProgressIndicator();
        }
      }
      ),
    );
  }
}