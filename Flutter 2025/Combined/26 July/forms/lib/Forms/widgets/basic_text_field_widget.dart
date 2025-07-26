import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class BasicTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const BasicTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.text_fields,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Text(
                  'Basic TextField',
                  style: AppTheme.subheadingStyle,
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            TextField(
              controller: controller,
              decoration: AppTheme.inputDecoration(
                labelText: 'Enter your name',
                hintText: 'John Doe',
                prefixIcon: Icons.person,
              ),
              onChanged: (value) {
                onChanged(value);
                print('Basic TextField changed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
