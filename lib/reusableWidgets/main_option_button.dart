import 'package:flutter/material.dart';

class MainOptionButton extends StatelessWidget {
  final String passedTitle;
  final IconData passedIcon;
  final Color passedColor;
  final Function passedNavigateFunction;

  const MainOptionButton({
    Key? key,
    required this.passedTitle,
    required this.passedIcon,
    required this.passedColor,
    required this.passedNavigateFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      margin: const EdgeInsets.all(10),
      color: passedColor,
      child: InkWell(
        onTap: () => passedNavigateFunction(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
