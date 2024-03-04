import 'package:flutter/material.dart';

typedef OnButton = void Function(String);

class CalculatorButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final OnButton onButtonClicked;

  const CalculatorButton({
    Key? key,
    required this.onButtonClicked,
    required this.title,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
          onPressed: () {
            onButtonClicked(title);
          },
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: CircleBorder(),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
