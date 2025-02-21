import 'package:flutter/material.dart';
import '../models/calculator_model.dart';
import '../screens/converter_screen.dart';

class CalculatorController extends ChangeNotifier 
{

  final CalculatorModel calculator = CalculatorModel();

  String get input => calculator.input;
  String get output => calculator.output;
  bool get hideInput => calculator.hideInput;
  double get outputSize => calculator.outputSize;

  void onButtonClick(String value, BuildContext context) 
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
    else if (value == "conv") 
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConverterScreen()),
      );
    } 
    else if (value != "History") 
    {
           calculator.appendInput(value);
    }

    notifyListeners();
  }
}
