import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_recomendations/core/theme.dart';

class ByNatureButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final bool isSelected;

  const ByNatureButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.gradientColors,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: Colors.grey, width: 4) : null,
          color: DefaultColors.greyParts,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(
                icon,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: GoogleFonts.alegreyaSans(
                fontSize: FontSizes.medium,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
