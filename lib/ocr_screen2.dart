// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import './reusableWidgets/custom_appbar.dart';

// class OcrScreen2 extends StatefulWidget {
//   const OcrScreen2({Key? key}) : super(key: key);

//   @override
//   _OcrScreen2State createState() => _OcrScreen2State();
// }

// class _OcrScreen2State extends State<OcrScreen2> {
//   final ImagePicker _picker = ImagePicker();
//   XFile _pickedImage;

//   // Select the image from the camera
//   Future pickCameraImage() async {
//     final pickedCameraImage = await _picker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _pickedImage = pickedCameraImage;
//     });
//   }

//   // Select the image from the gallery
//   Future pickGalleryImage() async {
//     final pickedGalleryImage = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _pickedImage = pickedGalleryImage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'OCR Test 2'),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Image.file(File(_pickedImage.path)),
//               ElevatedButton(
//                 onPressed: () => {},
//                 child: const Text('Pick from Camera'),
//               ),
//               ElevatedButton(
//                 onPressed: () => {},
//                 child: const Text('Pick from Gallery'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
