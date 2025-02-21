import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/converter_controller.dart';

class ConverterScreen extends StatelessWidget 
{
  final TextEditingController milesController = TextEditingController();

  @override
  Widget build(BuildContext context) 
  {
    final converterController = Provider.of<ConverterController>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Kilometers to Miles Converter")),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            TextField(
              controller: milesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter kilometers", border: OutlineInputBorder()),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => converterController.convertKmToMiles(milesController.text),
              child: Text("Convert"),
            ),

            SizedBox(height: 20),
            Text(
              converterController.result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Back to Calculator"),
            ),
            
          ],
        ),
      ),
    );
  }
}
