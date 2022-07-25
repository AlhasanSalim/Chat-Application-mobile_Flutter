import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Color? textBtnColor;
  final Function() onPressed;
  const Button(
    {
      super.key,
      required this.text,
      this.textBtnColor = Colors.white,
      required this.onPressed,
      required this.color
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 150,
          height: 42,
          child: Text(
            text,
            style: TextStyle(
              color: textBtnColor
            ),
          ),
        ),
      ),
    );
  }
}