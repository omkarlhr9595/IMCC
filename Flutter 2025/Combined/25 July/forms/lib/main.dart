import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forms/forms/form_widget.dart';
import 'package:forms/id_card.dart';
import 'package:forms/visiting_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Assignment 1'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              IdCardWidget(),
              SizedBox(height: 20),
              VisitingCardWidget(),
              SizedBox(height: 20),
              IdCardWidget(),
              SizedBox(height: 20),
              VisitingCardWidget(),
              SizedBox(height: 20),
              IdCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
