import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/calculator_controller.dart';
import 'controllers/converter_controller.dart';
import 'screens/calculator_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance(); // Ensures storage is ready
 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalculatorController()),
        ChangeNotifierProvider(create: (context) => ConverterController()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculatorScreen(),
      ),

    ),
  );
}
