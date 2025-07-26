import 'package:flutter/material.dart';

class OutputDisplayWidget extends StatelessWidget {
  final String basicText;
  final String passwordText;
  final String numberText;
  final String multilineText;
  final String emailText;
  final String phoneText;
  final String searchText;
  final String urlText;
  final String dateText;
  final String timeText;
  final String currencyText;
  final String percentageText;
  final String addressText;
  final String nameText;
  final String streetAddressText;
  final String zipCodeText;

  const OutputDisplayWidget({
    super.key,
    required this.basicText,
    required this.passwordText,
    required this.numberText,
    required this.multilineText,
    required this.emailText,
    required this.phoneText,
    required this.searchText,
    required this.urlText,
    required this.dateText,
    required this.timeText,
    required this.currencyText,
    required this.percentageText,
    required this.addressText,
    required this.nameText,
    required this.streetAddressText,
    required this.zipCodeText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Current Values',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                _buildValueItem(context, 'Basic', basicText),
                _buildValueItem(context, 'Name', nameText),
                _buildValueItem(context, 'Password', '•' * passwordText.length),
                _buildValueItem(context, 'Age', numberText),
                _buildValueItem(context, 'Description', multilineText),
                _buildValueItem(context, 'Address', addressText),
                _buildValueItem(context, 'Street', streetAddressText),
                _buildValueItem(context, 'ZIP Code', zipCodeText),
                _buildValueItem(context, 'Email', emailText),
                _buildValueItem(context, 'Phone', phoneText),
                _buildValueItem(context, 'Search', searchText),
                _buildValueItem(context, 'URL', urlText),
                _buildValueItem(context, 'Date', dateText),
                _buildValueItem(context, 'Time', timeText),
                _buildValueItem(context, 'Currency', currencyText),
                _buildValueItem(context, 'Percentage', percentageText),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueItem(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value.isEmpty ? 'Not set' : value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: value.isEmpty ? theme.colorScheme.onSurfaceVariant : theme.colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
} 