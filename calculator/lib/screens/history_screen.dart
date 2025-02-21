import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calculator_controller.dart';

class HistoryScreen extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    final calculatorController = Provider.of<CalculatorController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculation History"),
        
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => calculatorController.clearHistory(),
          ),
        ],
      ),
      
      body: calculatorController.history.isEmpty
          ? Center(child: Text("No history available"))
          : ListView.builder(
              itemCount: calculatorController.history.length,
              itemBuilder: (context, index)
              {
                return ListTile(
                  title: Text(calculatorController.history[index]),
                );
              },
            ),

    );
  }
}
