import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calculator_controller.dart';

class CalculatorButton extends StatelessWidget
{
  final String text;
  final Color buttonBgColor;
  final Color tColor;

  const CalculatorButton(
  {
    Key? key,
    required this.text,
    this.buttonBgColor = Colors.grey,
    this.tColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(20),
            backgroundColor: buttonBgColor,
          ),
          
          onPressed: () => Provider.of<CalculatorController>(context, listen: false).onButtonClick(text, context), 
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: tColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

  }
}
