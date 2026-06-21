import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (Banned: purple/violet)
  static const Color primary = Color(0xff2E7D32);       // Dark green representing rice leaves
  static const Color primaryDark = Color(0xff1E4620);   // Darker green for bottom bar background
  static const Color accent = Color(0xffF9A825);        // Warm yellow representing ripe rice
  static const Color accentLight = Color(0xffFFF176);   // Light yellow for highlights

  // Feedback Colors
  static const Color success = Color(0xff388E3C);
  static const Color warning = Color(0xffF57C00);
  static const Color error = Color(0xffC62828);
  static const Color info = Color(0xff1976D2);

  // Neutral Colors (Light Theme)
  static const Color backgroundLight = Color(0xffF1F8E9); // Soft light green-gray background
  static const Color surfaceLight = Color(0xffFAFAFA);    // Off-white surface
  static const Color cardLight = Color(0xffFFFFFF);       // Clean white for cards
  static const Color textPrimaryLight = Color(0xff1A1F16);  // Very dark gray-green
  static const Color textSecondaryLight = Color(0xff555F50); // Muted gray-green
  static const Color borderLight = Color(0xffE0E5DD);     // Soft border color
  static const Color dividerLight = Color(0xffECEFF1);

  // Neutral Colors (Dark Theme)
  static const Color backgroundDark = Color(0xff121510);  // Deep charcoal with green tint
  static const Color surfaceDark = Color(0xff1A1F16);     // Dark gray-green surface
  static const Color cardDark = Color(0xff22291E);        // Slightly lighter dark surface for cards
  static const Color textPrimaryDark = Color(0xffECEFF1);   // Very light gray
  static const Color textSecondaryDark = Color(0xff90A4AE); // Muted cool gray
  static const Color borderDark = Color(0xff2D3529);      // Dark border color
  static const Color dividerDark = Color(0xff263238);

  // Status/Label Colors
  static const Color debtColor = Color(0xffD32F2F);       // Red for unpaid/debt
  static const Color paidColor = Color(0xff388E3C);       // Green for paid
  static const Color depositColor = Color(0xffF57C00);    // Orange for deposit
}
