import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E8), // Light teal-green background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Display Area
              Container(
                width: double.infinity,
                height: 400,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Display number
                    Text(
                      '7,789',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              
              // Calculator buttons
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(text: 'AC', backgroundColor: Colors.purple[200]!),
                        CalculatorButton(text: '()', backgroundColor: Colors.blue[200]!),
                        CalculatorButton(text: '%', backgroundColor: Colors.blue[200]!),
                        CalculatorButton(text: '÷', backgroundColor: Colors.blue[200]!),
                      ],
                    ),
                    // Row 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CalculatorButton(text: '7', backgroundColor: Colors.white),
                        const CalculatorButton(text: '8', backgroundColor: Colors.white),
                        const CalculatorButton(text: '9', backgroundColor: Colors.white),
                        CalculatorButton(text: '×', backgroundColor: Colors.blue[200]!),
                      ],
                    ),
                    // Row 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CalculatorButton(text: '4', backgroundColor: Colors.white),
                        const CalculatorButton(text: '5', backgroundColor: Colors.white),
                        const CalculatorButton(text: '6', backgroundColor: Colors.white),
                        CalculatorButton(text: '−', backgroundColor: Colors.blue[200]!),
                      ],
                    ),
                    // Row 4
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CalculatorButton(text: '1', backgroundColor: Colors.white),
                        const CalculatorButton(text: '2', backgroundColor: Colors.white),
                        const CalculatorButton(text: '3', backgroundColor: Colors.white),
                        CalculatorButton(text: '+', backgroundColor: Colors.blue[200]!),
                      ],
                    ),
                    // Row 5
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CalculatorButton(text: '0', backgroundColor: Colors.white),
                        const CalculatorButton(text: '•', backgroundColor: Colors.white),
                        const BackspaceButton(),
                        CalculatorButton(text: '=', backgroundColor: Colors.blue[200]!),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class BackspaceButton extends StatelessWidget {
  const BackspaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.backspace,
          color: Colors.grey[700],
          size: 24,
        ),
      ),
    );
  }
}
