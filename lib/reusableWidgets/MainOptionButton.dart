import 'package:flutter/material.dart';

class MainOptionButton extends StatelessWidget {
  final String passedTitle;

  const MainOptionButton({
    Key? key,
    required this.passedTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // borderRadius: BorderRadius.circular(20.0),
      elevation: 3.0,
      color: Colors.cyan,
      child: InkWell(
        onTap: () => {},
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.center_focus_strong_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              passedTitle,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
