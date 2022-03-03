import 'dart:async';
import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

import './reusableWidgets/custom_appbar.dart';
import './models/result.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  List<Result> _outputs = <Result>[];
  List<CameraDescription>? cameras; //list out the cameras available
  CameraController? cameraController; //controller for camera
  XFile? image; //file for captured image
  CameraImage? cameraImage;
  var _modelLoaded = false;
  var _isDetecting = false;
  var _class = '';
  var _confidence = 0.0;

  Future loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
      // labels: "assets/model/labels.txt",
      // model: "assets/model/model.tflite",
      labels: 'assets/tflite/labels.txt',
      model: 'assets/tflite/model_unquant.tflite',
    );
    debugPrint('Loaded Model');
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      cameraController = CameraController(cameras![0], ResolutionPreset.medium, enableAudio: false);
      //cameras[0] = first camera, change to 1 to another camera
      cameraController!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          cameraController!.startImageStream((image) {
            if (!_modelLoaded) return;
            if (_isDetecting) return;
            _isDetecting = true;
            try {
              _modelLoaded && runModel(image);
            } catch (e) {
              debugPrint('$e');
            }
          });
        });
      });
      debugPrint('Loaded Camera');
    } else {
      debugPrint("No cameras found.");
    }
  }

  runModel(CameraImage cameraImage) async {
    debugPrint('Running Model');
    await Tflite.runModelOnFrame(
      bytesList: cameraImage.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      // imageHeight: cameraImage!.height,
      // imageWidth: cameraImage!.width,
      // imageMean: 127.5,
      // imageStd: 127.5,
      numResults: 1,
      // rotation: 0,
      // threshold: 0.1,
    ).then((recognition) {
      setState(() {
        if (recognition!.isNotEmpty) {
          debugPrint('Recognition Length: $recognition.length');
          _outputs.clear();
          recognition.forEach((element) {
            _outputs.add(Result(element['confidence'], element['index'], element['label']));
            _class = element['label'];
            _confidence = element['confidence'];
            debugPrint(
                "Prediction Result: confidence: ${element['confidence']}, index: ${element['index']}, class: ${element['label']}");
          });
        }
        // Sort based on most confidence
        _outputs.sort((a, b) => a.confidence.compareTo(b.confidence));
        _isDetecting = false;
      });
      // Send Results
      // tfLiteResultsController.add(_outputs);
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((value) => setState(() {
          _modelLoaded = true;
        }));
    loadCamera();
  }

  @override
  void dispose() {
    Tflite.close();
    cameraController!.stopImageStream();
    cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const CustomAppBar(title: 'Translate Screen'),
        body: Column(
          children: [
            SizedBox(
              height: size.width,
              width: size.height,
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  "Class: $_class, Confidence: $_confidence",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ));
  }
}
