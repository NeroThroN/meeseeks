import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typo = [
      Theme.of(context).textTheme.displayLarge,
      Theme.of(context).textTheme.displayMedium,
      Theme.of(context).textTheme.displaySmall,
      Theme.of(context).textTheme.headlineLarge,
      Theme.of(context).textTheme.headlineMedium,
      Theme.of(context).textTheme.headlineSmall,
      Theme.of(context).textTheme.titleLarge,
      Theme.of(context).textTheme.bodyLarge,
      Theme.of(context).textTheme.bodyMedium,
      Theme.of(context).textTheme.bodySmall,
      Theme.of(context).textTheme.labelLarge,
      Theme.of(context).textTheme.labelMedium,
      Theme.of(context).textTheme.labelSmall,
    ];
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...typo.map((e) => Text("I'm Mr. Meeseeks, look at me!", style: e)),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Press me!'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
