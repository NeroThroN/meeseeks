import 'package:flutter/material.dart';
import 'package:meeseeks/style/themes.style.dart';

/// A loading screen that displays a splash screen and a loading spinner
class LoadingScreen extends StatefulWidget {
  final Widget child;

  const LoadingScreen({super.key, required this.child});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /// Indicates if the splash animation ended
  bool _splashEnded = false;

  /// Indicates if all futures are done loading
  bool _loadEnded = false;

  /// Indicates if the screen should be loading
  bool get loading => !_splashEnded || !_loadEnded;

  @override
  void initState() {
    reset();
    super.initState();
  }

  // Reset the loading screen
  void reset() {
    setState(() {
      _splashEnded = false;
      _loadEnded = false;
    });

    // Handles the end of the splash screen animation (minimum 2 seconds)
    Future.delayed(const Duration(seconds: 2)).then((_) => setState(() => _splashEnded = true));

    // Launch the loading
    _load();
  }

  /// Load all futures
  Future<void> _load() async {
    /// Load the fonts from Google Fonts
    await ThemesStyle.fetchFonts();

    // End of the loading
    setState(() => _loadEnded = true);
  }

  @override
  Widget build(BuildContext context) {
    // Show child widget (Other screens)
    if (!loading) return widget.child;

    // Otherwise display the splash screen
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          color: Theme.of(context).colorScheme.onPrimary,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
