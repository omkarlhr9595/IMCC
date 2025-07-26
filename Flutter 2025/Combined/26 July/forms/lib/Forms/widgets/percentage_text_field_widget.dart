import 'package:flutter/material.dart';

class PercentageTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const PercentageTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<PercentageTextFieldWidget> createState() => _PercentageTextFieldWidgetState();
}

class _PercentageTextFieldWidgetState extends State<PercentageTextFieldWidget> {
  double _percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Percentage Slider',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.percent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Slider(
                        value: _percentage,
                        min: 0.0,
                        max: 100.0,
                        divisions: 100,
                        label: '${_percentage.round()}%',
                        onChanged: (double value) {
                          setState(() {
                            _percentage = value;
                          });
                          widget.onChanged('${value.round()}%');
                          print('Percentage Slider changed: ${value.round()}%');
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Selected: ${_percentage.round()}%',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 