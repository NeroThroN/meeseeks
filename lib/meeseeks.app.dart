import 'package:flutter/material.dart';

class MeeseeksApp extends StatelessWidget {
  const MeeseeksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("I'm Mr. Meeseeks, look at me!"),
        ),
      ),
    );
  }
}
