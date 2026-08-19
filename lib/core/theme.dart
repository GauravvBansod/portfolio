import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFF07080B);
  static const surface = Color(0x0AFFFFFF); // rgba(255,255,255,.04)
  static const surfaceStrong = Color(0x14FFFFFF);
  static const border = Color(0x14FFFFFF);
  static const borderStrong = Color(0x24FFFFFF);
  static const text = Color(0xFFEDEFF5);
  static const textMuted = Color(0x9EEDEFF5);
  static const textFaint = Color(0x70EDEFF5);
  static const violet = Color(0xFF7C5CFF);
  static const violetSoft = Color(0xFFA78BFA);
  static const violetPale = Color(0xFFC4B5FD);
  static const cyan = Color(0xFF22D3EE);
}

class AppGradients {
  static const brand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.violet, AppColors.cyan],
  );
  static final glass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white.withOpacity(.06), Colors.white.withOpacity(.02)],
  );
  static final accentCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.violet.withOpacity(.16),
      AppColors.cyan.withOpacity(.07),
      Colors.white.withOpacity(.02),
    ],
  );
}

class AppText {
  static TextStyle display(double size, {Color color = Colors.white}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: size,
        height: 1.02,
        fontWeight: FontWeight.w600,
        letterSpacing: -size * .03,
        color: color,
      );

  static TextStyle heading(double size, {Color color = Colors.white}) =>
      GoogleFonts.spaceGrotesk(
        fontSize: size,
        height: 1.1,
        fontWeight: FontWeight.w600,
        letterSpacing: -size * .02,
        color: color,
      );

  static TextStyle body(double size, {Color color = AppColors.textMuted}) =>
      GoogleFonts.ibmPlexSans(
        fontSize: size,
        height: 1.65,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle mono(double size, {Color color = AppColors.textFaint}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: size,
        height: 1.4,
        letterSpacing: size * .14,
        fontWeight: FontWeight.w500,
        color: color,
      );
}

ThemeData buildAppTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.violet,
      secondary: AppColors.cyan,
      surface: AppColors.bg,
    ),
    textTheme: GoogleFonts.ibmPlexSansTextTheme(base.textTheme)
        .apply(bodyColor: AppColors.text, displayColor: Colors.white),
    splashFactory: NoSplash.splashFactory,
  );
}
