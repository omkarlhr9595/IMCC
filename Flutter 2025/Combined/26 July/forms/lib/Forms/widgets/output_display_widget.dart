import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics,
                  color: AppTheme.primaryColor,
                  size: 20,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Text(
                  'Current Values',
                  style: AppTheme.subheadingStyle,
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingM),
            Wrap(
              spacing: AppTheme.spacingM,
              runSpacing: AppTheme.spacingS,
              children: [
                _buildValueItem('Basic', basicText),
                _buildValueItem('Name', nameText),
                _buildValueItem('Password', '•' * passwordText.length),
                _buildValueItem('Age', numberText),
                _buildValueItem('Description', multilineText),
                _buildValueItem('Address', addressText),
                _buildValueItem('Street', streetAddressText),
                _buildValueItem('ZIP Code', zipCodeText),
                _buildValueItem('Email', emailText),
                _buildValueItem('Phone', phoneText),
                _buildValueItem('Search', searchText),
                _buildValueItem('URL', urlText),
                _buildValueItem('Date', dateText),
                _buildValueItem('Time', timeText),
                _buildValueItem('Currency', currencyText),
                _buildValueItem('Percentage', percentageText),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusS),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTheme.captionStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value.isEmpty ? 'Not set' : value,
            style: AppTheme.bodyStyle.copyWith(
              color: value.isEmpty ? AppTheme.textHintColor : AppTheme.textPrimaryColor,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
} 