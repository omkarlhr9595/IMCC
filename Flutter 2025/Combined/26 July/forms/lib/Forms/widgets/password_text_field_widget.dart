import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const PasswordTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Password TextField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: widget.controller,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Enter password',
                hintText: '••••••••',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                widget.onChanged(value);
                print('Password TextField changed: ${'•' * value.length}');
              },
            ),
          ],
        ),
      ),
    );
  }
} 