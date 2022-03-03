import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

import './reusableWidgets/custom_appbar.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  var _recognition;
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? cameraController; //controller for camera
  XFile? image; //file for captured image
  CameraImage? cameraImage;

  Future loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
      // labels: "assets/model/labels.txt",
      // model: "assets/model/model.tflite",
      labels: 'assets/tflite/labels.txt',
      model: 'assets/tflite/model_unquant.tflite',
    );
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      cameraController = CameraController(cameras![0], ResolutionPreset.medium);
      //cameras[0] = first camera, change to 1 to another camera
      cameraController!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          cameraController!.startImageStream((image) => {
                cameraImage = image,
                runModel(),
              });
        });
      });
    } else {
      print("No cameras found.");
    }
  }

  runModel() async {
    _recognition = await Tflite.runModelOnFrame(
      bytesList: cameraImage!.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage!.height,
      imageWidth: cameraImage!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 1,
      rotation: 0,
      threshold: 0.1,
    );
    setState(() {
      cameraImage;
    });
    print('Recognition: $_recognition');
  }

  @override
  void initState() {
    super.initState();
    loadModel();
    loadCamera();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController!.stopImageStream();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Translate Screen'),
      body: Center(
          child: Column(
        children: [
          Container(
            height: size.width,
            width: size.height - 100,
            child: cameraController == null
                ? const Center(
                    child: Text('Loading Camera...'),
                  )
                : !cameraController!.value.isInitialized
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio, child: CameraPreview(cameraController!)),
            // child: (cameraController!.value.isInitialized)
            //     ? const Center(child: CircularProgressIndicator())
            //     : AspectRatio(
            //         aspectRatio: cameraController!.value.aspectRatio,
            //         child: CameraPreview(cameraController!),
            //       ),
          ),
          Text('Prediction: $_recognition'),
        ],
      )),
    );
  }
}
