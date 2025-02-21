import 'package:flutter/material.dart';
import '../models/converter_model.dart';

class ConverterController extends ChangeNotifier 
{
  String result = "";

  void convertKmToMiles(String input) 
  {
    double kilometers = double.tryParse(input) ?? 0;
    ConverterModel converter = ConverterModel(kilometers: kilometers);
    result = converter.getFormattedResult();
   
    notifyListeners();
  }
}
