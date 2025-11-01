import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Text(
              '🎉Welcome to the app🎉',
              style: GoogleFonts.sahitya(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.network(
            "https://s3.amazonaws.com/ebooks.syncfusion.com/LiveReadOnlineFiles/flutter-ui-succinctly/Images/ui-to-code-relationship.png",
            width: 200,
            height: 200,
          ),
          Image.asset("assets/iron_man.png"),
        ],
      ),
    );
  }
}
