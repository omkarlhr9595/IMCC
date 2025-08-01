import 'package:flutter/material.dart';
import 'package:identity_card/screens/identity_card_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IdentityCardScreen()
    );
  }
}
