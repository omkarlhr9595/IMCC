import 'package:calculator/calculator/utils/calculator_expression_evaluator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorExpressionEvaluator', () {
    late CalculatorExpressionEvaluator evaluator;

    setUp(() {
      evaluator = CalculatorExpressionEvaluator();
    });

    test('evaluates basic arithmetic expressions', () {
      expect(evaluator.evaluate('2+3*4'), 14);
      expect(evaluator.evaluate('10-2/2'), 9);
      expect(evaluator.evaluate('8/2+3'), 7);
    });

    test('handles percentage values', () {
      expect(evaluator.evaluate('50%'), 0.5);
      expect(evaluator.evaluate('100+20%'), 100.2);
    });
  });
}
