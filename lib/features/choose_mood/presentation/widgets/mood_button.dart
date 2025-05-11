import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_recomendations/core/theme.dart';

class MoodButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final bool isSelected;

  const MoodButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.gradientColors,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: isSelected
                  ? Border.all(color: Colors.grey, width: 4)
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: GoogleFonts.alegreyaSans(
            fontSize: FontSizes.medium,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
