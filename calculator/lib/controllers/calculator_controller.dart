import 'package:flutter/material.dart';
import '../models/calculator_model.dart';
import '../screens/converter_screen.dart';
import '../screens/history_screen.dart';

class CalculatorController extends ChangeNotifier 
{

  final CalculatorModel calculator = CalculatorModel();

  String get input => calculator.input;
  String get output => calculator.output;
  bool get hideInput => calculator.hideInput;
  double get outputSize => calculator.outputSize;
  List<String> get history => calculator.history;

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
    else if (value == "History") 
    {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HistoryScreen()),
      );
    }

    else
    {
    calculator.appendInput(value);
    }

    notifyListeners();
  } 

  void clearHistory() 
  {
    calculator.clearHistory();
    notifyListeners();
  }
}
