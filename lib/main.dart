import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meeseeks/meeseeks.app.dart';
import 'package:meeseeks/providers/config.provider.dart';

void main() async {
  // Initialize the binding before running the app
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the shared preferences
  final prefsOverrides = await Prefs.init();

  // Launch the app
  runApp(ProviderScope(
    overrides: [...prefsOverrides],
    child: const MeeseeksApp(),
  ));
}
