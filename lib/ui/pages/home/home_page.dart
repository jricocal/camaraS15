import 'package:aplicationcamera/domain/use_cases/controllers/camera_controller.dart';
import 'package:aplicationcamera/ui/pages/home/camera/camera_screen.dart';
import 'package:aplicationcamera/ui/pages/home/preview/preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget _content = const CameraScreen();
  final CamController camState = Get.find<CamController>();

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 1:
          _content = const PreviewScreen();
          break;
        default:
          _content = const CameraScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Camera"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _content,
          ),
        ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (camState.cameraInitialized) {
            try {
              final image = await camState.controller.takePicture();
              camState.path = image.path;
            } catch (e) {
              print(e);
            }
          }
        },
        child: const Icon(Icons.camera_rounded),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_rounded),
            label: 'Cámara',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_size_select_actual_outlined),
            label: 'Ver',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}