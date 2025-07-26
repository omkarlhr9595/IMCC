import 'package:flutter/material.dart';

class AddressTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const AddressTextFieldWidget({
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
              'Address TextField (Multiline)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Enter your address',
                hintText: 'Street, City, State, ZIP',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              onChanged: (value) {
                onChanged(value);
                print('Address TextField changed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
} 