import 'package:flutter/material.dart';
import './reusableWidgets/MainOptionButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const optionsList = <Map>[];
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sign Language Translator'),
      // ),
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
                    color: Colors.cyan,
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
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return MainOptionButton(
                      passedTitle: 'Option $index',
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
