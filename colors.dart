import 'package:flutter/material.dart';

class MedicalColors {
  // Medical Blue & Green Theme
  static const Color medicalBlue = Color(0xFF2c7be5);
  static const Color medicalGreen = Color(0xFF00d97e);
  static const Color medicalLightBlue = Color(0xFFeaf2fd);
  static const Color darkBlue = Color(0xFF12263f);
  static const Color white = Color(0xFFffffff);
  static const Color gray = Color(0xFF95aac9);
  static const Color lightGray = Color(0xFFf1f4f8);
  static const Color veryLightBlue = Color(0xFFf8f9fa);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [medicalBlue, medicalGreen],
  );

  static const LinearGradient lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [medicalLightBlue, Color(0xFFf0f9ff)],
  );
}
