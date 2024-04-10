import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'config.provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences prefs(PrefsRef ref) => throw UnimplementedError();

/// Logger class used to encapsulate the shared preferences instance
/// and to initialize it with the app
abstract class Prefs {
  /// Initialize the shared preferences
  static Future<Iterable<Override>> init() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    /// Returns the list of providers to override
    return [prefsProvider.overrideWithValue(sharedPrefs)];
  }
}

@riverpod
class ThemeSwitcher extends _$ThemeSwitcher {
  /// The default ThemeMode to applied
  static const ThemeMode defaultMode = ThemeMode.system;

  /// The key of preferences where the value is stored
  static const prefsKey = 'config.thememode';

  @override
  ThemeMode build() {
    /// The stored config inside the preferences
    final storedConfig = ref.read(prefsProvider).getString(prefsKey);
    // Returns the ThemeMode based on the stored value or the default one
    return ThemeMode.values.byName(storedConfig ?? defaultMode.name);
  }

  /// Set the new [ThemeMode] for the app and store it
  void setMode(ThemeMode? mode) {
    // Replace the mode by the default one in case it is null
    mode ??= defaultMode;
    // Stores the mode's name inside the preferences
    ref.read<SharedPreferences>(prefsProvider).setString(prefsKey, mode.name);
    state = mode;
  }
}
