import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'colors.style.dart';

abstract class ThemesStyle {
  /// The light theme of the app
  static ThemeData get light => _lightTheme;

  /// The dark theme of the app
  static ThemeData get dark => _darkTheme;

  /// Fetch the fonts used in the app
  static Future<void> fetchFonts() => GoogleFonts.pendingFonts([_mainFont, _titleFont]);

  /// Enable drag to scroll in the whole app with the default physics
  static ScrollBehavior scrollBehavior(BuildContext context) => ScrollConfiguration.of(context).copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        overscroll: true,
        physics: const BouncingScrollPhysics(),
      );

  /// Initialize the system chrome settings
  static Future<void> initSystemChrome() async {
    // Lock the phone application to be vertical
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Remove the Android background color behind navigation bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));

    // Enable the edge-to-edge mode for Android
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}

/// The main font used in the app
final _mainFont = GoogleFonts.montserrat();
final _mainFontTheme = GoogleFonts.montserratTextTheme();

/// The title font used in the app
final _titleFont = GoogleFonts.gloriaHallelujah();
final _titleFontTheme = GoogleFonts.gloriaHallelujahTextTheme();

/// The default text theme used in the app based on the main and title fonts
final TextTheme _defaultTextTheme = TextTheme(
  displayLarge: _titleFontTheme.displayLarge,
  displayMedium: _titleFontTheme.displayMedium,
  displaySmall: _titleFontTheme.displaySmall,
  headlineLarge: _titleFontTheme.headlineLarge,
  headlineMedium: _titleFontTheme.headlineMedium,
  headlineSmall: _titleFontTheme.headlineSmall,
  bodyLarge: _mainFontTheme.bodyLarge,
  bodyMedium: _mainFontTheme.bodyMedium,
  bodySmall: _mainFontTheme.bodySmall,
  labelLarge: _mainFontTheme.labelLarge,
  labelMedium: _mainFontTheme.labelMedium,
  labelSmall: _mainFontTheme.labelSmall,
  titleLarge: _mainFontTheme.titleLarge,
  titleMedium: _mainFontTheme.titleMedium,
  titleSmall: _mainFontTheme.titleSmall,
);

/// Theme configuration shared between light and dark theme
ThemeData _commmonTheme = ThemeData(
  primaryColor: _Colors.primary,
  textTheme: _defaultTextTheme,
  fontFamily: _mainFont.fontFamily,
  navigationBarTheme: const NavigationBarThemeData(
    elevation: 0,
    indicatorColor: _Colors.primary,
    height: 64,
  ),
  navigationRailTheme: const NavigationRailThemeData(
    indicatorColor: _Colors.primary,
    minExtendedWidth: 200,
  ),
);

const _lightCardColor = Colors.white;
const _lightBackgroundColor = Color(0xffeeeeee);

/// The light theme of the app
ThemeData _lightTheme = _commmonTheme.copyWith(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    primary: _Colors.primary,
    onPrimary: _Colors.onPrimary,
    secondary: _Colors.secondary,
    onSecondary: _Colors.onSecondary,
    error: _Colors.error,
    onError: _Colors.onError,
    brightness: Brightness.light,
    surface: _lightCardColor,
    onSurface: Colors.black,
  ),
  scaffoldBackgroundColor: _lightBackgroundColor,
  cardColor: _lightCardColor,
  canvasColor: _lightCardColor,
  textTheme: _commmonTheme.textTheme.apply(displayColor: Colors.black, bodyColor: Colors.black),
  appBarTheme: ThemeData.light().appBarTheme.copyWith(
        elevation: 0,
        color: _lightCardColor,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: _Colors.primary, foregroundColor: Colors.black),
  ),
  cardTheme: const CardTheme(
    elevation: 0,
    color: _lightCardColor,
  ),
  navigationBarTheme: _commmonTheme.navigationBarTheme.copyWith(backgroundColor: _lightCardColor),
  navigationRailTheme: _commmonTheme.navigationRailTheme.copyWith(backgroundColor: _lightCardColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: _Colors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
    hoverElevation: 0,
  ),
);

const _darkCardColor = Color.fromARGB(255, 32, 32, 36);
const _darkBackgroundColor = Color(0xff111113);

/// The dark theme of the app
ThemeData _darkTheme = _commmonTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    primary: _Colors.primary,
    onPrimary: _Colors.onPrimary,
    secondary: _Colors.secondary,
    onSecondary: _Colors.onSecondary,
    error: _Colors.error,
    onError: _Colors.onError,
    brightness: Brightness.dark,
    surface: _darkCardColor,
    onSurface: Colors.white,
  ),
  scaffoldBackgroundColor: _darkBackgroundColor,
  cardColor: _darkCardColor,
  canvasColor: _darkCardColor,
  textTheme: _commmonTheme.textTheme.apply(displayColor: Colors.white, bodyColor: Colors.white),
  appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        elevation: 0,
        backgroundColor: _darkCardColor,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: _Colors.primary, foregroundColor: Colors.black),
  ),
  cardTheme: const CardTheme(
    elevation: 0,
    color: _darkCardColor,
  ),
  navigationBarTheme: _commmonTheme.navigationBarTheme.copyWith(backgroundColor: _darkCardColor),
  navigationRailTheme: _commmonTheme.navigationRailTheme.copyWith(backgroundColor: _darkCardColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: _Colors.primary,
    foregroundColor: Colors.black,
    elevation: 0,
    hoverElevation: 0,
  ),
);
