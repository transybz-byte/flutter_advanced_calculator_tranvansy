import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _expression = '';
  String _result = '0';
  List<String> _history = [];
  bool _isRad = true;

  String get expression => _expression;
  String get result => _result;
  List<String> get history => _history;
  bool get isRad => _isRad;

  void toggleAngleMode() {
    _isRad = !_isRad;
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }

  void onButtonPressed(String text) {
    if (text == 'C') {
      _expression = '';
      _result = '0';
    } else if (text == 'CE') {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    } else if (text == '=') {
      _calculate();
    } else if (text == 'sin' || text == 'cos' || text == 'tan' || text == 'log' || text == '√') {
      if (text == '√') {
        _expression += 'sqrt(';
      } else {
        _expression += '$text(';
      }
    } else {
      if (_result != '0' && !_isOperator(text)) {
        _expression = text;
        _result = '0';
      } else {
        _expression += text;
      }
    }
    notifyListeners();
  }

  void _calculate() {
    try {
      String finalExp = _expression
          .replaceAll('x', '*')
          .replaceAll('÷', '/')
          .replaceAll('π', '3.14159265')
          .replaceAll('e', '2.71828');

      if (!_isRad) {
        finalExp = finalExp.replaceAllMapped(RegExp(r'(sin|cos|tan)\(([^)]+)\)'), (match) {
          String func = match.group(1)!;
          String value = match.group(2)!;
          return '$func($value * 3.14159265 / 180)';
        });
      }

      Parser p = Parser();
      Expression exp = p.parse(finalExp);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      
      String oldExp = _expression;
      _result = eval.toString();
      
      if (_result.endsWith(".0")) {
        _result = _result.substring(0, _result.length - 2);
      }

      _history.insert(0, '$oldExp = $_result');
      if (_history.length > 50) _history.removeLast();

    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }

  bool _isOperator(String x) {
    return ['+', '-', 'x', '÷'].contains(x);
  }
}