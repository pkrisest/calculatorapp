import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calculator_controller.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget 
{
 
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
        
        children:[
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
                    style: TextStyle(fontSize: 50, color: Colors.black),
                  ),
                  
                  SizedBox(height: 20),
                  Text(
                    calculator.output,
                    style: TextStyle(
                      fontSize: calculator.outputSize,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  
                  SizedBox(height: 30),
                ],

              ),
            ),
          ),


          buildButtonRow(context, ["AC", "del", "conv", "/"], buttonBgColor: operatorColor, tColor: orangeColor),
              buildButtonRow(context, ["7", "8", "9", "x"]),
              buildButtonRow(context, ["4", "5", "6", "-"]),
              buildButtonRow(context, ["1", "2", "3", "+"]),
              buildButtonRow(context, ["%", "0", ".", "="]),
              buildButtonRow(context, ["History"], buttonBgColor: orangeColor),
        
        ],
      ),
    );
  }

  Widget buildButtonRow(BuildContext context, List<String> texts, {Color buttonBgColor = buttonColor, Color tColor = Colors.white}) {
    return Row(
      children: texts.map((text) => CalculatorButton(text: text, buttonBgColor: buttonBgColor, tColor: tColor)).toList(),
    );
  }
}
