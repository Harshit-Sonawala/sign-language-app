import 'package:flutter/material.dart';

import './reusableWidgets/custom_appbar.dart';

class OcrScreen extends StatefulWidget {
  const OcrScreen({Key? key}) : super(key: key);

  @override
  _OcrScreenState createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'OCR Screen'),
      body: Center(
        child: Column(
          children: const [
            Text('OCR Screen'),
          ],
        ),
      ),
    );
  }
}
