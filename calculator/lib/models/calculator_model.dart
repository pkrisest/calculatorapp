import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class CalculatorModel 
{
  String input = "";
  String output = "";
  bool hideInput = false;
  double outputSize = 50;
  List<String> history = [];


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

  void evaluateExpression() async
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
  
        DateTime now = DateTime.now();
        String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        await saveHistory("$formattedTime      $userInput = $output");
      } 
      
      catch (e) 
      {
        output = "Error";
      }
    }
  }

  void appendInput(String value) 
  {
      input += value;
      hideInput = false;
      outputSize = 34;
 
  }

  Future<void> saveHistory(String calculation) async 
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    history.insert(0, calculation); 
    await prefs.setStringList('calcHistory', history);
    
  }

  Future<void> clearHistory() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    history.clear();
    await prefs.remove('calcHistory');
    
  }
}