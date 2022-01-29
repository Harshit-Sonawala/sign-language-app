import 'package:flutter/material.dart';

class MainOptionButton extends StatelessWidget {
  final String passedTitle;
  final IconData passedIcon;
  final Color passedColor;
  final String passedNavigate;

  const MainOptionButton(
      {Key? key,
      required this.passedTitle,
      required this.passedIcon,
      required this.passedColor,
      required this.passedNavigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      color: passedColor,
      child: InkWell(
        onTap: () => {},
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              passedIcon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              passedTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
