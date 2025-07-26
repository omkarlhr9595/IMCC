import 'package:flutter/material.dart';

class ZipCodeTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const ZipCodeTextFieldWidget({
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
              'ZIP Code TextField (Postal Code Keyboard)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Enter ZIP code',
                hintText: '12345',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
                counterText: '',
              ),
              onChanged: (value) {
                onChanged(value);
                print('ZIP Code TextField changed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
} 