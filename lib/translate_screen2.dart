// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// import './reusableWidgets/custom_appbar.dart';

// import './helpers/app_helper.dart';
// import './helpers/camera_helper.dart';
// import './helpers/tflite_helper.dart';
// import './models/result.dart';

// class TranslateScreen2 extends StatefulWidget {
//   const TranslateScreen2({Key key}) : super(key: key);

//   @override
//   State<TranslateScreen2> createState() => _TranslateScreen2State();
// }

// class _TranslateScreen2State extends State<TranslateScreen2> with TickerProviderStateMixin {
//   AnimationController _colorAnimController;
//   Animation _colorTween;
//   final FlutterTts flutterTts = FlutterTts();

//   List<Result> outputs;

//   @override
//   void initState() {
//     super.initState();

//     //Load TFLite Model
//     TFLiteHelper.loadModel().then((value) {
//       setState(() {
//         TFLiteHelper.modelLoaded = true;
//       });
//     });

//     //Initialize Camera
//     CameraHelper.initializeCamera();

//     //Setup Animation
//     _setupAnimation();

//     //Subscribe to TFLite's Classify events
//     TFLiteHelper.tfLiteResultsController.stream.listen(
//         (value) {
//           value.forEach((element) {
//             _colorAnimController.animateTo(element.confidence,
//                 curve: Curves.bounceIn, duration: Duration(milliseconds: 500));
//           });

//           //Set Results
//           outputs = value; //as List<Result>;

//           //Update results on screen
//           setState(() {
//             //Set bit to false to allow detection again
//             CameraHelper.isDetecting = false;
//           });
//         },
//         onDone: () {},
//         onError: (error) {
//           AppHelper.log("listen", error);
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Translate Screen'),
//       body: FutureBuilder<void>(
//         future: CameraHelper.initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return Stack(
//               children: <Widget>[
//                 CameraPreview(CameraHelper.camera),
//                 _buildResultsWidget(width, outputs),
//               ],
//             );
//           } else {
//             // Otherwise, display a loading indicator.
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     flutterTts.stop();
//     TFLiteHelper.disposeModel();
//     CameraHelper.camera.dispose();
//     AppHelper.log("dispose", "Clear resources.");
//     super.dispose();
//   }

//   Widget _buildResultsWidget(double width, List<Result> outputs) {
//     Future speak(String s) async {
//       await flutterTts.setLanguage("en-US");
//       await flutterTts.setPitch(1);
//       await flutterTts.setSpeechRate(0.5);
//       await flutterTts.speak(s);
//     }

//     return Positioned.fill(
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           height: 200.0,
//           width: width,
//           color: Colors.white,
//           child: outputs != null && outputs.isNotEmpty
//               ? ListView.builder(
//                   itemCount: outputs.length,
//                   shrinkWrap: true,
//                   padding: const EdgeInsets.all(20.0),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                       children: <Widget>[
//                         Text(
//                           outputs[index].label,
//                           style: TextStyle(
//                             color: _colorTween.value,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                         AnimatedBuilder(
//                             animation: _colorAnimController,
//                             builder: (context, child) => LinearPercentIndicator(
//                                   width: width * 0.88,
//                                   lineHeight: 14.0,
//                                   percent: outputs[index].confidence,
//                                   progressColor: _colorTween.value,
//                                 )),
//                         Text(
//                           "${(outputs[index].confidence * 100.0).toStringAsFixed(2)} %",
//                           style: TextStyle(
//                             color: _colorTween.value,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                         Center(
//                           child: FlatButton(
//                             onPressed: () {
//                               speak("${outputs[index].label}");
//                             },
//                             child: const Icon(
//                               Icons.play_arrow,
//                               size: 60,
//                               color: Color(0xff375079),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   })
//               : const Center(
//                   child: Text("Waiting for model to detect..",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20.0,
//                       ))),
//         ),
//       ),
//     );
//   }

//   void _setupAnimation() {
//     _colorAnimController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//     _colorTween = ColorTween(begin: Colors.green, end: Colors.red).animate(_colorAnimController);
//   }
// }
