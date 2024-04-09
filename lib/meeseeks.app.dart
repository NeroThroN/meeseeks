import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meeseeks/router/config.router.dart';

class MeeseeksApp extends ConsumerWidget {
  const MeeseeksApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// The app's router configuration
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Meeseeks',
      routerConfig: router,
    );
  }
}
