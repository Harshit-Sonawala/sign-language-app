import 'dart:io'; // for 'File' type
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_language_app/reusableWidgets/custom_appbar.dart';
import 'package:tflite/tflite.dart';

class TranslateScreenFinal extends StatefulWidget {
  const TranslateScreenFinal({Key? key}) : super(key: key);

  @override
  State<TranslateScreenFinal> createState() => _TranslateScreenFinalState();
}

class _TranslateScreenFinalState extends State<TranslateScreenFinal> {
  PickedFile? _image;
  bool _loading = false;
  List<dynamic>? _outputs;
  final ImagePicker _picker = ImagePicker();

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model/model_unquant.tflite',
      labels: 'assets/model/labels.txt',
    );
  }

  classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      // Declare List _outputs in the class which will be used to show the classified class name and confidence
      _outputs = output;
    });
  }

  Future<void> _optiondialogbox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text(
                      "Take a Picture",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    onTap: openCamera,
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: const Text(
                      "Select image ",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    onTap: openGallery,
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  //camera method
  Future openGallery() async {
    var picture = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
    classifyImage(picture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _optiondialogbox,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.image, color: Colors.white),
      ),
      appBar: CustomAppBar(title: 'Translate Sign Language'),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null ? Container() : Image.file(File(_image!.path)),
                  const SizedBox(height: 20),
                  _outputs != null
                      ? Text(
                          'Prediction: ${_outputs![0]["label"]}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        )
                      : const Text(
                          'No Predictions Made',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:tflite/tflite.dart';

// class TranslateScreenFinal extends StatefulWidget {
//   @override
//   _TranslateScreenFinalState createState() => _TranslateScreenFinalState();
// }

// class _TranslateScreenFinalState extends State<TranslateScreenFinal> {
//   String answer = '';
//   CameraController? cameraController;
//   CameraImage? cameraImage;

//   loadmodel() async {
//     Tflite.loadModel(
//       model: 'assets/model/model_unquant.tflite',
//       labels: 'assets/model/labels.txt',
//     );
//   }

//   initCamera() {
//     // cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     cameraController = CameraController(
//         const CameraDescription(
//           name: '0', // 0 for back camera and 1 for front camera
//           lensDirection: CameraLensDirection.back,
//           sensorOrientation: 0,
//         ),
//         ResolutionPreset.high);

//     cameraController!.initialize().then(
//       (value) {
//         if (!mounted) {
//           return;
//         }
//         setState(
//           () {
//             cameraController!.startImageStream(
//               (image) => {
//                 if (true)
//                   {
//                     cameraImage = image,
//                     applymodelonimages(),
//                   }
//               },
//             );
//           },
//         );
//       },
//     );
//   }

//   applymodelonimages() async {
//     if (cameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//           bytesList: cameraImage!.planes.map(
//             (plane) {
//               return plane.bytes;
//             },
//           ).toList(),
//           imageHeight: cameraImage!.height,
//           imageWidth: cameraImage!.width,
//           imageMean: 127.5,
//           imageStd: 127.5,
//           rotation: 90,
//           numResults: 3,
//           threshold: 0.1,
//           asynch: true);

//       answer = '';

//       predictions!.forEach(
//         (prediction) {
//           answer +=
//               //  prediction['label'].toString().substring(0, 1).toUpperCase() +
//               prediction['label'].toString().substring(1) +
//                   " " +
//                   //    (prediction['confidence'] as double).toStringAsFixed(3) +
//                   '\n';
//         },
//       );

//       setState(
//         () {
//           answer = answer;
//         },
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     initCamera();
//     loadmodel();
//   }

//   @override
//   void dispose() async {
//     super.dispose();

//     await Tflite.close();
//     cameraController!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple),
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           body: cameraImage != null
//               ? Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.blue,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         child: Center(
//                           child: SizedBox(
//                             height: MediaQuery.of(context).size.height,
//                             width: MediaQuery.of(context).size.width,
//                             child: AspectRatio(
//                               aspectRatio: cameraController!.value.aspectRatio,
//                               child: CameraPreview(
//                                 cameraController!,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Center(
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             color: Colors.black87,
//                             child: Center(
//                               child: Text(
//                                 answer,
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(fontSize: 20, color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               : Container(),
//         ),
//       ),
//     );
//   }
// }
