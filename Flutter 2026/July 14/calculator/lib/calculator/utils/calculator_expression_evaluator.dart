import 'package:math_expressions/math_expressions.dart';

class CalculatorExpressionEvaluator {
  double evaluate(String expression) {
    final normalized = expression
        .replaceAll(' ', '')
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('−', '-')
        .replaceAll('%', '/100');

    if (normalized.isEmpty) {
      throw ArgumentError('Expression cannot be empty');
    }

    final parser = Parser();
    final parsed = parser.parse(normalized);
    final result = parsed.evaluate(EvaluationType.REAL, ContextModel());

    if (result is num) {
      return result.toDouble();
    }

    throw ArgumentError('Expression did not evaluate to a number');
  }
}
