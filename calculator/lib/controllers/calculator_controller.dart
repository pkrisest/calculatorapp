import '../models/calculator_model.dart';
import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier 
{
  final CalculatorModel calculator = CalculatorModel();

  String get input => calculator.input;
  String get output => calculator.output;
  bool get hideInput => calculator.hideInput;
  double get outputSize => calculator.outputSize;

  void onButtonClick(String value) 
  {
    if (value == "AC") 
    {
      calculator.clear();
    } 
    else if (value == "del") 
    {
      calculator.delete();
    } 
    else if (value == "=") 
    {
      calculator.evaluateExpression();
    } 
    else 
    {
      calculator.appendInput(value);
    }

    notifyListeners();
  }
}
