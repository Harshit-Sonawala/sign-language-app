import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'reusableWidgets/custom_drawer.dart';
import 'reusableWidgets/main_option_button.dart';

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
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Language Translator'),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 3.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
      ),
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
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                      passedNavigate: optionsList[index]['optionNavigate']);
                }),
          ),
        ],
      ),
    );
  }
}
