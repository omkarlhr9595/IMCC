import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Greeting Card',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header
                Text(
                  'Birthday Greeting Card',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                
                // Decorative icon
                Icon(
                  Icons.cake,
                  size: 80,
                  color: Colors.pink[400],
                ),
                const SizedBox(height: 40),
                
                // Text field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    hintText: 'Type your name here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                
                // Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(
                              name: _nameController.text.trim(),
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      'See Your Gift',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final String name;
  
  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    
    // Start animation and show message after delay
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showMessage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 28),
                  color: Colors.pink[700],
                ),
              ),
              
              const Spacer(),
              
              // Lottie animation
              SizedBox(
                height: 300,
                child: Lottie.asset(
                  'assets/birthday.json',
                  controller: _animationController,
                  onLoaded: (composition) {
                    _animationController.duration = composition.duration;
                  },
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Birthday message
              AnimatedOpacity(
                opacity: _showMessage ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedSlide(
                  offset: _showMessage ? Offset.zero : const Offset(0, 0.3),
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    children: [
                      Text(
                        'Happy Birthday',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.name,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.pink[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '🎉 Wishing you a fantastic day filled with joy and laughter! 🎂',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
