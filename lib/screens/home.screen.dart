import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("I'm Mr. Meeseeks, look at me!", style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Press me!'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
