// import 'package:flutter/foundation.dart';
// import 'package:camera/camera.dart';

// import './app_helper.dart';
// import './tflite_helper.dart';

// class CameraHelper {
//   static CameraController camera;

//   static bool isDetecting = false;
//   static CameraLensDirection _direction = CameraLensDirection.back;
//   static Future<void> initializeControllerFuture;

//   static Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
//     return await availableCameras().then(
//       (List<CameraDescription> cameras) => cameras.firstWhere(
//         (CameraDescription camera) => camera.lensDirection == dir,
//       ),
//     );
//   }

//   static void initializeCamera() async {
//     AppHelper.log("_initializeCamera", "Initializing camera..");

//     camera = CameraController(
//       await _getCamera(_direction),
//       ResolutionPreset.medium,
//       enableAudio: false,
//     );

//     initializeControllerFuture = camera.initialize().then((value) {
//       AppHelper.log("_initializeCamera", "Camera initialized, starting camera stream..");

//       camera.startImageStream((CameraImage image) {
//         if (!TFLiteHelper.modelLoaded) return;
//         if (isDetecting) return;
//         isDetecting = true;
//         try {
//           TFLiteHelper.classifyImage(image);
//         } catch (e) {
//           debugPrint('$e');
//         }
//       });
//     });
//   }
// }
