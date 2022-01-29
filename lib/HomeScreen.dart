import 'package:flutter/material.dart';
import './reusableWidgets/MainOptionButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const optionsList = <Map>[
      {
        'optionId': 1,
        'optionTitle': 'Translate Sign Language',
        'optionIcon': Icons.translate_rounded,
        'optionColor': Colors.red,
        'optionNavigate': 'navigate',
      },
      {
        'optionId': 2,
        'optionTitle': 'Recognise Text (OCR)',
        'optionIcon': Icons.center_focus_strong_rounded,
        'optionColor': Colors.blue,
        'optionNavigate': 'navigate',
      },
      {
        'optionId': 3,
        'optionTitle': 'Read Text Out Loud',
        'optionIcon': Icons.record_voice_over,
        'optionColor': Colors.green,
        'optionNavigate': 'navigate',
      },
      {
        'optionId': 4,
        'optionTitle': 'ASL Guide',
        'optionIcon': Icons.my_library_books,
        'optionColor': Colors.deepPurple,
        'optionNavigate': 'navigate',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Language Translator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome, User!',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Choose your action:',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: optionsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MainOptionButton(
                        passedTitle: optionsList[index]['optionTitle'],
                        passedIcon: optionsList[index]['optionIcon'],
                        passedColor: optionsList[index]['optionColor'],
                        passedNavigate: optionsList[index]['optionNavigate']);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
