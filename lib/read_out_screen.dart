import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import './reusableWidgets/custom_appbar.dart';

class ReadOutScreen extends StatefulWidget {
  const ReadOutScreen({Key? key}) : super(key: key);

  @override
  State<ReadOutScreen> createState() => _ReadOutScreenState();
}

class _ReadOutScreenState extends State<ReadOutScreen> {
  final _inputController = TextEditingController();
  final FlutterTts tts = FlutterTts();

  _ReadOutScreenState() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Read Out Screen"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('Please enter the text you want spoken out loud:', style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _inputController,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter text to read out loud',
                    label: Text('Convert to Speech'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () => {tts.speak(_inputController.text)},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.record_voice_over,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Read Out Loud", style: TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _inputController.dispose();
    tts.stop();
    super.dispose();
  }
}
