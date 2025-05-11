import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FontSizes {
  static const large = 20.0;
  static const medium = 15.0;
}



class DefaultColors {
  static const Color textInput = Color.fromARGB(255, 97, 97, 97);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        titleMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.medium,
          fontWeight: FontWeight.bold,
          color: Colors.grey
        )
      )
    );
  }
}