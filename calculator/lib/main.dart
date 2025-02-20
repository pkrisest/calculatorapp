import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/calculator_controller.dart';

void main() 
{
  runApp
  (
    ChangeNotifierProvider
    (
      create: (context) => CalculatorController(),
      child: MaterialApp(home: CalculatorApp()),
    ),
  );
}

class CalculatorApp extends StatelessWidget 
{
  const CalculatorApp({super.key});

  static const operatorColor = Color.fromARGB(255, 67, 67, 67);
  static const buttonColor = Color.fromARGB(255, 45, 35, 35);
  static const orangeColor = Color(0xffD9802E);

  @override
  Widget build(BuildContext context) 
  {
    final calculator = Provider.of<CalculatorController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
       
        children: [
          // Input-Output Display
          Expanded(
           
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                
                children:[
                  
                  Text(
                    calculator.hideInput ? "" : calculator.input,
                    style: const TextStyle(fontSize: 50, color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  
                  Text(
                    calculator.output,
                    style: TextStyle(
                      fontSize: calculator.outputSize,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

  
          Column(
            children:
            
            [
              buildButtonRow(context, ["AC", "del", "conv", "/"], operatorColor, orangeColor),
              buildButtonRow(context, ["7", "8", "9", "x"]),
              buildButtonRow(context, ["4", "5", "6", "-"]),
              buildButtonRow(context, ["1", "2", "3", "+"]),
              buildButtonRow(context, ["%", "0", ".", "="]),
              buildButtonRow(context, ["History"], orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(BuildContext context, List<String> texts, [Color buttonBgColor = buttonColor, Color textColor = Colors.white]) 
  {
    return Row
    (
      children: texts.map((text) => buildButton(context, text, buttonBgColor, textColor)).toList(),
    );
  }

  Widget buildButton(BuildContext context, String text, Color buttonBgColor, Color tColor) 
  {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
         
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(22),
            backgroundColor: buttonBgColor,
          ),
          onPressed: () => Provider.of<CalculatorController>(context, listen: false).onButtonClick(text),
          
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: tColor, fontWeight: FontWeight.bold),
          ),
          
        ),
      ),
    );
  }

}
