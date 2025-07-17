import 'package:flutter/material.dart';

class IdentityCardScreen extends StatefulWidget {
  const IdentityCardScreen({super.key});

  @override
  State<IdentityCardScreen> createState() => _IdentityCardScreenState();
}

class _IdentityCardScreenState extends State<IdentityCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My IdentityCard")),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/d/d7/Harry_Potter_character_poster.jpg/250px-Harry_Potter_character_poster.jpg"),
            Image.asset(
              "assets/images/harry_potter.jpg",
              width: 2000,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
// flutter pub get