import 'package:flutter/material.dart';

/// Color Palette - Nature-inspired with earthy tones and calming teals
class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF305669);      // Dark teal - App bars, buttons, key UI
  static const Color secondary = Color(0xFF8ABEB9);    // Medium teal - FABs, secondary buttons
  static const Color background = Color(0xFFB7E5CD);   // Light mint - Cards, surfaces, backgrounds
  static const Color accent = Color(0xFFC1785A);       // Terracotta - Accents, warnings, CTAs

  // Text Colors
  static const Color textPrimary = Color(0xFF1A2E36);       // Body text, headings
  static const Color textSecondary = Color(0xFF5A7380);     // Subtitles, captions, helper text
  static const Color textLight = Color(0xFFFFFFFF);         // Text on dark backgrounds
  static const Color textInteractive = Color(0xFF8ABEB9);   // Links, clickable text
  static const Color textWarning = Color(0xFFC1785A);       // Warnings, errors, emphasis
}