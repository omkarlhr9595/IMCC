import 'package:flutter/material.dart';

class NumberTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const NumberTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Number TextField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter age',
                hintText: '25',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
              onChanged: (value) {
                onChanged(value);
                print('Number TextField changed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
} 