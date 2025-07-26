import 'package:flutter/material.dart';

class CurrencyTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CurrencyTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<CurrencyTextFieldWidget> createState() => _CurrencyTextFieldWidgetState();
}

class _CurrencyTextFieldWidgetState extends State<CurrencyTextFieldWidget> {
  String _selectedCurrency = 'USD';
  final List<String> _currencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'CAD',
    'AUD',
    'CHF',
    'CNY',
    'INR',
    'BRL'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Currency Selector',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCurrency,
              decoration: const InputDecoration(
                labelText: 'Select Currency',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
              items: _currencies.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedCurrency = newValue;
                  });
                  widget.onChanged(newValue);
                  print('Currency Selector changed: $newValue');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
} 