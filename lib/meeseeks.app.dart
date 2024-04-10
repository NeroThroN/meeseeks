import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meeseeks/providers/config.provider.dart';
import 'package:meeseeks/router/config.router.dart';
import 'package:meeseeks/style/themes.style.dart';

class MeeseeksApp extends ConsumerWidget {
  const MeeseeksApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// The app's router configuration
    final router = ref.watch(routerProvider);

    /// The theme mode of the application based on themeSwitcher's provider
    final themeMode = ref.watch(themeSwitcherProvider);

    return MaterialApp.router(
      title: 'Meeseeks',
      routerConfig: router,
      themeMode: themeMode,
      theme: ThemesStyle.light,
      darkTheme: ThemesStyle.dark,
      scrollBehavior: ThemesStyle.scrollBehavior(context),
    );
  }
}
