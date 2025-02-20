//main.dart

import 'package:flutter/material.dart';


void main()
{
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}
  
class CalculatorApp extends StatefulWidget 
{
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> 

// muutujad
{
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideInput = false;
  var outputSize = 3.0;

static const operatorColor = Color.fromARGB(255, 67, 67, 67);
static const buttonColor = Color.fromARGB(255, 45, 35, 35);
static const orangeColor = Color(0xffD9802E);


  @override
  Widget build(BuildContext context) 
  
  {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
     
      body: Column(
        children: [
        //input output area
        Expanded(child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hideInput ? "" : input,
                style: TextStyle(
                  fontSize: 50,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                output,
                style: TextStyle(
                  fontSize: outputSize,
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
            ),
          )),
        
        //Nupud
        
        Row(
          children: [
            button(text: "AC", buttonBgColor: operatorColor, tColor: orangeColor),
            button(text: "<", buttonBgColor: operatorColor, tColor: orangeColor),
            button(text: "conv", buttonBgColor: operatorColor, tColor: orangeColor),
            button(text: "/", buttonBgColor: operatorColor, tColor: orangeColor),
          ],
        ),
        Row(
          children: [
            button(text: "7"),
            button(text: "8"),
            button(text: "9"),
            button(text: "x", tColor: orangeColor, buttonBgColor: operatorColor),
          ],
        ),
        Row(
          children: [
            button(text: "4"),
            button(text: "5"),
            button(text: "6"),
            button(text: "-", tColor: orangeColor, buttonBgColor: operatorColor),
          ],
        ),
        Row(
          children: [
            button(text: "1"),
            button(text: "2"),
            button(text: "3"),
            button(text: "+", tColor: orangeColor, buttonBgColor: operatorColor),
          ],
        ),
        Row(
          children: [
            button(text: "%", tColor: orangeColor, buttonBgColor: operatorColor),
            button(text: "0"),
            button(text: "."),
            button(text: "=", buttonBgColor: orangeColor),
          ],
        ),

        Row(
          children: [
            button(text: "History", buttonBgColor: orangeColor),
          ],
        ),
      ]),
      
    );
  }


  Widget button(
  {
    text, tColor = Colors.white, buttonBgColor = buttonColor
  })
    
  {
    return Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: const EdgeInsets.all(22),
                   backgroundColor: buttonBgColor,
                  ),
                  onPressed: () => onButtonClick(text),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      color: tColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
              ),
            );
  }

  onButtonClick(value)
  {
    
  }

}