import 'package:flutter/material.dart';

class StreetAddressTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const StreetAddressTextFieldWidget({
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
              'Street Address TextField (Street Address Keyboard)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.streetAddress,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Enter street address',
                hintText: '123 Main Street',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
              onChanged: (value) {
                onChanged(value);
                print('Street Address TextField changed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
} 