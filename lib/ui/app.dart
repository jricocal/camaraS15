import 'package:aplicationcamera/domain/use_cases/controllers/camera_controller.dart';
import 'package:aplicationcamera/ui/pages/home/home_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  final CameraDescription camera;

  const App({Key? key, required this.camera}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late final CamController camController;

  @override
  void initState() {
    camController = Get.put(CamController(widget.camera));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}