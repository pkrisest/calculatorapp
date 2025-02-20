import 'package:math_expressions/math_expressions.dart';

class CalculatorModel 
{
  String input = "";
  String output = "";
  bool hideInput = false;
  double outputSize = 50;

  void clear() 
  {
    input = "";
    output = "";
  }

  void delete() 
  {
    if (input.isNotEmpty) 
    {
      input = input.substring(0, input.length - 1);
    }
  }

  void evaluateExpression() 
  {
    if (input.isNotEmpty) 
    {
      try 
      {
        var userInput = input.replaceAll("x", "*");
        Parser parser = Parser();
        Expression expression = parser.parse(userInput);
        ContextModel contextModel = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, contextModel);
        output = finalValue.toString();

        if (output.endsWith(".0")) 
        {
          output = output.substring(0, output.length - 2);
        }
        
        input = output;
        hideInput = true;
        outputSize = 52;
      } 
      
      catch (e) 
      {
        output = "Error";
      }
    }
  }

  void appendInput(String value) 
  {
    if (value != "conv" && value != "History") 
    {
      input += value;
      hideInput = false;
      outputSize = 34;
    }
  }
}
