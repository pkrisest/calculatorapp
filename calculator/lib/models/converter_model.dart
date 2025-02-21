class ConverterModel 
{
  double kilometers;
  double miles;

  ConverterModel({required this.kilometers}) : miles = kilometers / 1.60934;

  String getFormattedResult() 
  {
    return "$kilometers kilometers = ${miles.toStringAsFixed(2)} miles";
  }
}
