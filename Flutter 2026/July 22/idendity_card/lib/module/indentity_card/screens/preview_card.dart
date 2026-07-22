import 'package:flutter/material.dart';
import 'indentity_card.dart';

class PreviewCardScreen extends StatelessWidget {
  const PreviewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IndentityCardScreen(),
              ),
            );
          },
          child: Hero(
            tag: 'profileImage',
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.black, width: 5),
                borderRadius: BorderRadius.circular(150),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
