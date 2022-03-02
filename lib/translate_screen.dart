import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

import './reusableWidgets/custom_appbar.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //file for captured image

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Translate Screen'),
      body: Center(child: Text('Translate Screen')),
    );
  }
}
