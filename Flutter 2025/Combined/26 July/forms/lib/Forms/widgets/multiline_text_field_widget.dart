import 'package:flutter/material.dart';

class MultilineTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const MultilineTextFieldWidget({
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
              'Multiline TextField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Enter description',
                hintText: 'Write something about yourself...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
              onChanged: (value) {
                onChanged(value);
                print('Multiline TextField changed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
} 