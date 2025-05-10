import 'package:flutter/material.dart';

class MoodButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const MoodButton({super.key, required this.text, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
        ),
      ),
    );
  }
}