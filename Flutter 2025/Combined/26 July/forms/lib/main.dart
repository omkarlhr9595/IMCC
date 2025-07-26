import 'package:flutter/material.dart';
import 'package:forms/Forms/forms_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form TextField Demo',
      theme: MaterialTheme(Theme.of(context).textTheme).light(),
      home: const FormScreen(),
    );
  }
}
