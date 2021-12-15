import 'package:aplicationcamera/ui/app.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Obtener una lista de las camaras 
  // disponibles en el dispositivo
  final cameras = await availableCameras();
  // Obtener una camara en especifico
  // de la lista de camaras disponibles
  final firstCamera = cameras.first;

  runApp(App(camera: firstCamera));
}


