import 'package:flutter/material.dart';
import 'package:sign_language_app/reusableWidgets/custom_appbar.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'models/asl_element.dart';

class ASLGuideScreen extends StatefulWidget {
  const ASLGuideScreen({Key? key}) : super(key: key);

  @override
  State<ASLGuideScreen> createState() => _ASLGuideScreenState();
}

class _ASLGuideScreenState extends State<ASLGuideScreen> {
  final FlutterTts tts = FlutterTts();

  final guideList = <ASLElement>[
    ASLElement(
        elementTitle: 'A',
        elementDescription: 'The letter A',
        elementImagePath: 'assets/images/A.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'B',
        elementDescription: 'The letter B',
        elementImagePath: 'assets/images/B.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'C',
        elementDescription: 'The letter C',
        elementImagePath: 'assets/images/C.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'D',
        elementDescription: 'The letter D',
        elementImagePath: 'assets/images/D.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'E',
        elementDescription: 'The letter E',
        elementImagePath: 'assets/images/E.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'F',
        elementDescription: 'The letter F',
        elementImagePath: 'assets/images/F.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'G',
        elementDescription: 'The letter G',
        elementImagePath: 'assets/images/G.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'H',
        elementDescription: 'The letter H',
        elementImagePath: 'assets/images/H.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'I',
        elementDescription: 'The letter I',
        elementImagePath: 'assets/images/I.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'J',
        elementDescription: 'The letter J',
        elementImagePath: 'assets/images/J.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'K',
        elementDescription: 'The letter K',
        elementImagePath: 'assets/images/K.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'L',
        elementDescription: 'The letter L',
        elementImagePath: 'assets/images/L.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'M',
        elementDescription: 'The letter M',
        elementImagePath: 'assets/images/M.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'N',
        elementDescription: 'The letter N',
        elementImagePath: 'assets/images/N.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'O',
        elementDescription: 'The letter O',
        elementImagePath: 'assets/images/O.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'P',
        elementDescription: 'The letter P',
        elementImagePath: 'assets/images/P.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'Q',
        elementDescription: 'The letter Q',
        elementImagePath: 'assets/images/Q.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'R',
        elementDescription: 'The letter R',
        elementImagePath: 'assets/images/R.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'S',
        elementDescription: 'The letter S',
        elementImagePath: 'assets/images/S.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'T',
        elementDescription: 'The letter T',
        elementImagePath: 'assets/images/T.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'U',
        elementDescription: 'The letter U',
        elementImagePath: 'assets/images/U.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'V',
        elementDescription: 'The letter V',
        elementImagePath: 'assets/images/V.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'W',
        elementDescription: 'The letter W',
        elementImagePath: 'assets/images/W.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'X',
        elementDescription: 'The letter X',
        elementImagePath: 'assets/images/X.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'Y',
        elementDescription: 'The letter Y',
        elementImagePath: 'assets/images/Y.jpg',
        elementType: 'Letter'),
    ASLElement(
        elementTitle: 'Z',
        elementDescription: 'The letter Z',
        elementImagePath: 'assets/images/Z.jpg',
        elementType: 'Letter'),
  ];

  _ASLGuideScreenState() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'ASL Guide'),
      body: ListView.builder(
          itemCount: guideList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              elevation: 2.0,
              child: ListTile(
                onTap: () => {tts.speak(guideList[index].elementTitle)},
                leading: Image.asset(
                  guideList[index].elementImagePath,
                ),
                title: Text(guideList[index].elementTitle),
                subtitle: Text(guideList[index].elementDescription),
                trailing: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      guideList[index].elementType,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }
}
