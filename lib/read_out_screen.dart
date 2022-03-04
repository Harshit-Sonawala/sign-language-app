import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import './reusableWidgets/custom_appbar.dart';

class ReadOutScreen extends StatefulWidget {
  const ReadOutScreen({Key? key}) : super(key: key);

  @override
  State<ReadOutScreen> createState() => _ReadOutScreenState();
}

class _ReadOutScreenState extends State<ReadOutScreen> {
  final _inputController = new TextEditingController();
  final FlutterTts tts = FlutterTts();

  _ReadOutScreenState() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Read Out Screen"),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: TextField(
                  controller: _inputController,
                ),
              ),
              ElevatedButton(
                onPressed: () => {tts.speak(_inputController.text)},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Read Out Loud",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
