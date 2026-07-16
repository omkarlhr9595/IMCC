import 'package:calculator/calculator/utils/calculator_expression_evaluator.dart';
import 'package:calculator/calculator/widgets/backspace_button.dart';
import 'package:calculator/calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorExpressionEvaluator _evaluator = CalculatorExpressionEvaluator();
  String _display = '0';
  String _expression = '';
  bool _shouldResetDisplay = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      switch (buttonText) {
        case 'AC':
          _display = '0';
          _expression = '';
          _shouldResetDisplay = false;
          break;
        case 'CE':
          _display = '0';
          _shouldResetDisplay = false;
          break;
        case '=':
          _calculateResult();
          break;
        case '÷':
        case '×':
        case '−':
        case '+':
        case '%':
          _handleOperator(buttonText);
          break;

        case '•':
          _handleDecimal();
          break;
        default:
          _handleNumber(buttonText);
      }
    });
  }

  void _handleNumber(String number) {
    if (_shouldResetDisplay) {
      _display = number;
      _shouldResetDisplay = false;
    } else {
      if (_display == '0') {
        _display = number;
      } else {
        _display += number;
      }
    }
  }

  void _handleOperator(String operator) {
    // Add current display value to expression if it's not zero or if we're not resetting
    if (_display != '0' || !_shouldResetDisplay) {
      _expression += _display;
    }
    _expression += _getOperatorSymbol(operator);
    _shouldResetDisplay = true;
  }

  void _handleDecimal() {
    if (!_display.contains('.')) {
      _display += '.';
    }
  }

  String _getOperatorSymbol(String displayOperator) {
    switch (displayOperator) {
      case '÷':
        return '/';
      case '×':
        return '*';
      case '−':
        return '-';
      case '+':
        return '+';
      case '%':
        return '%';
      default:
        return displayOperator;
    }
  }

  void _calculateResult() {
    try {
      _expression += _display;
      final result = _evaluator.evaluate(_expression);
      _display = _formatResult(result);
      _expression = '';
      _shouldResetDisplay = true;
    } catch (e) {
      _display = 'Error';
      _expression = '';
      _shouldResetDisplay = true;
    }
  }

  String _formatResult(double result) {
    if (result == result.toInt()) {
      return result.toInt().toString();
    } else {
      // Simple formatting: show up to 8 decimal places, then trim trailing zeros
      String formatted = result.toStringAsFixed(8);

      // Remove trailing zeros
      while (formatted.endsWith('0') && formatted.contains('.')) {
        formatted = formatted.substring(0, formatted.length - 1);
      }

      // Remove trailing decimal point
      if (formatted.endsWith('.')) {
        formatted = formatted.substring(0, formatted.length - 1);
      }

      return formatted;
    }
  }

  void _onBackspace() {
    setState(() {
      if (_display.length > 1) {
        _display = _display.substring(0, _display.length - 1);
      } else {
        _display = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E8), // Light teal-green background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Display Area
              Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Expression display
                    Text(
                      _expression,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Display number
                    Text(
                      _display,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Calculator buttons
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final spacing = 10.0;
                    final availableWidth = constraints.maxWidth;
                    final availableHeight = constraints.maxHeight;

                    final buttonWidth = (availableWidth - (3 * spacing)) / 4;
                    final buttonHeight = (availableHeight - (4 * spacing)) / 5;
                    final aspectRatio = buttonWidth / buttonHeight;

                    return GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: spacing,
                      crossAxisSpacing: spacing,
                      childAspectRatio: aspectRatio,
                      children: [
                        // Row 1
                        CalculatorButton(
                          text: 'AC',
                          backgroundColor: Colors.purple[200]!,
                          onPressed: () => _onButtonPressed('AC'),
                        ),
                        CalculatorButton(
                          text: 'CE',
                          backgroundColor: Colors.orange[200]!,
                          onPressed: () => _onButtonPressed('CE'),
                        ),
                        CalculatorButton(
                          text: '%',
                          backgroundColor: Colors.blue[200]!,
                          onPressed: () => _onButtonPressed('%'),
                        ),
                        CalculatorButton(
                          text: '÷',
                          backgroundColor: Colors.blue[200]!,
                          onPressed: () => _onButtonPressed('÷'),
                        ),
                        // Row 2
                        CalculatorButton(
                          text: '7',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('7'),
                        ),
                        CalculatorButton(
                          text: '8',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('8'),
                        ),
                        CalculatorButton(
                          text: '9',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('9'),
                        ),
                        CalculatorButton(
                          text: '×',
                          backgroundColor: Colors.blue[200]!,
                          onPressed: () => _onButtonPressed('×'),
                        ),
                        // Row 3
                        CalculatorButton(
                          text: '4',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('4'),
                        ),
                        CalculatorButton(
                          text: '5',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('5'),
                        ),
                        CalculatorButton(
                          text: '6',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('6'),
                        ),
                        CalculatorButton(
                          text: '−',
                          backgroundColor: Colors.blue[200]!,
                          onPressed: () => _onButtonPressed('−'),
                        ),
                        // Row 4
                        CalculatorButton(
                          text: '1',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('1'),
                        ),
                        CalculatorButton(
                          text: '2',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('2'),
                        ),
                        CalculatorButton(
                          text: '3',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('3'),
                        ),
                        CalculatorButton(
                          text: '+',
                          backgroundColor: Colors.blue[200]!,
                          onPressed: () => _onButtonPressed('+'),
                        ),
                        // Row 5
                        CalculatorButton(
                          text: '0',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('0'),
                        ),
                        CalculatorButton(
                          text: '•',
                          backgroundColor: Colors.white,
                          onPressed: () => _onButtonPressed('•'),
                        ),
                        BackspaceButton(onPressed: _onBackspace),
                        CalculatorButton(
                          text: '=',
                          backgroundColor: Colors.blue[200]!,
                          onPressed: () => _onButtonPressed('='),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
