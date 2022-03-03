import 'package:flutter/material.dart';

import 'reusableWidgets/custom_appbar.dart';
import 'reusableWidgets/custom_drawer.dart';
import 'reusableWidgets/main_option_button.dart';

import 'ocr_screen.dart';
// import 'ocr_screen2.dart';
// import 'translate_screen.dart';
import 'translate_screen2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var optionsList = <Map>[
      {
        'optionId': 1,
        'optionTitle': 'Translate Sign Language',
        'optionIcon': Icons.translate_rounded,
        'optionColor': Colors.red,
        'optionNavigate': () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TranslateScreen2()),
              )
            },
      },
      {
        'optionId': 2,
        'optionTitle': 'Recognise Text (OCR)',
        'optionIcon': Icons.center_focus_strong_rounded,
        'optionColor': const Color(0xFF00B0FF),
        'optionNavigate': () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OcrScreen()),
              )
            },
      },
      {
        'optionId': 3,
        'optionTitle': 'Read Out Loud',
        'optionIcon': Icons.record_voice_over,
        'optionColor': Colors.green,
        'optionNavigate': () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OcrScreen()),
              )
            },
      },
      {
        'optionId': 4,
        'optionTitle': 'Transcribe Text',
        'optionIcon': Icons.mic_rounded,
        'optionColor': Colors.orange,
        'optionNavigate': () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OcrScreen()),
              )
            },
      },
      {
        'optionId': 5,
        'optionTitle': 'ASL Guide',
        'optionIcon': Icons.my_library_books,
        'optionColor': Colors.indigo,
        'optionNavigate': () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OcrScreen()),
              )
            },
      },
      {
        'optionId': 6,
        'optionTitle': 'Other',
        'optionIcon': Icons.handyman_rounded,
        'optionColor': Colors.purple,
        'optionNavigate': () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OcrScreen()),
              )
            },
      },
    ];

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: 'Sign Language Translator'),
      backgroundColor: const Color(0xFFF4F4F4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FractionallySizedBox(
            widthFactor: 1, // 100% width
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, User!',
                      style: TextStyle(
                        // color: Color(0xFF00B0FF),
                        color: Theme.of(context).primaryColor,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Choose your action:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 2.0,
                  // crossAxisSpacing: 2.0,
                ),
                itemCount: optionsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainOptionButton(
                      passedTitle: optionsList[index]['optionTitle'],
                      passedIcon: optionsList[index]['optionIcon'],
                      passedColor: optionsList[index]['optionColor'],
                      passedNavigateFunction: optionsList[index]['optionNavigate']);
                }),
          ),
        ],
      ),
    );
  }
}
