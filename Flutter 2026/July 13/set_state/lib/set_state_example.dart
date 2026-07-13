import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  int _result = 0;

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inline Function Demonstration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _num1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Number 1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.add, size: 32, color: Colors.blue),
                ),
                Expanded(
                  child: TextField(
                    controller: _num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Number 2',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // Button 1: Inline calculation without setState
            ElevatedButton(
              onPressed: () {
                // Inline logic running directly inside the callback
                final int val1 = int.tryParse(_num1Controller.text) ?? 0;
                final int val2 = int.tryParse(_num2Controller.text) ?? 0;
                _result = val1 + val2; 
                print('Updated inline (No UI change): $_result');
              },
              child: const Text('1. Inline Addition Only'),
            ),
            const SizedBox(height: 12),
            
            // Button 2: Inline call to empty setState
            ElevatedButton(
              onPressed: () {
                setState(() {}); // Inline empty state trigger
              },
              child: const Text('2. Inline setState Only'),
            ),
            const SizedBox(height: 12),
            
            // Button 3: Inline calculation wrapped directly inside setState
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // The entire math calculation lives inside the inline setState block
                  final int val1 = int.tryParse(_num1Controller.text) ?? 0;
                  final int val2 = int.tryParse(_num2Controller.text) ?? 0;
                  _result = val1 + val2;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('3. Inline Both (Add & Update)'),
            ),
          ],
        ),
      ),
    );
  }
}