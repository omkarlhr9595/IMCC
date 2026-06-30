import 'package:flutter/material.dart';
import 'package:idendity_card/module/indentity_card/screens/indentity_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IndentityCardScreen(),
    );
  }
}
