import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

// This is the second screen that shows the birthday message with animation
class BirthdayScreen extends StatefulWidget {
  // Variable to store the name passed from input screen
  final String name;

  const BirthdayScreen({
    super.key,
    required this.name,
  });

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/birthday.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay to make text readable
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie animation (foreground)
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Lottie.asset(
                    'assets/lottie/birthday_lottie.json',
                    // Animation plays once and then stops
                    repeat: true,
                    reverse: false,
                  ),
                ),

                const SizedBox(height: 30),

                // Happy Birthday text
                Text(
                  'Happy Birthday! 🎉',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fredoka(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Name display
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pacifico(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    shadows: const [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Wishful message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Wishing you a wonderful day filled with joy, laughter, and special moments!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
