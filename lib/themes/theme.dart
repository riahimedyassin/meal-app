import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final seedColor = ColorScheme.fromSeed(
  seedColor: Colors.red,
  brightness: Brightness.dark,
);
final theme = ThemeData(
  colorScheme: seedColor,
  appBarTheme: AppBarTheme(
    backgroundColor: seedColor.primaryContainer,
    titleTextStyle: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 26,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(),
    bodyMedium: GoogleFonts.poppins(),
    bodySmall: GoogleFonts.poppins()
  ),
);
