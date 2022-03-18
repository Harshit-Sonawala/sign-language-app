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

  final commonWordsList = <String>[
    'Hi',
    'Hello',
    'Yes',
    'No',
    'Okay',
    'Maybe',
    'Sure',
    'Not Sure',
    'Please',
    'Thank You',
    'Thanks',
    'Excuse Me',
    'Sorry',
    'Good',
    'Bad',
    'Fine',
    'When',
    'Where',
    'What',
    'Why',
    'How',
  ];

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
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text('Custom Sentence:', style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: ElevatedButton(
                  onPressed: () => {tts.speak(_inputController.text)},
                  child: Padding(
                    padding: const EdgeInsets.all(12),
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
                        Text("Read Out Loud", style: TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text('Quick Access:', style: TextStyle(fontSize: 18)),
              ),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 20),
                    itemCount: commonWordsList.length,
                    itemBuilder: (BuildContext context, int index) => ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(2),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                          ),
                          onPressed: () => {tts.speak(commonWordsList[index])},
                          child: Text(
                            commonWordsList[index],
                            style: const TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        )),
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
