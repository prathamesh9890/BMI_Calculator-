import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  String _result = '';
  Color _bgColor = Colors.pink.shade100;

  String get result => _result;
  Color get bgColor => _bgColor;

  final TextEditingController wtController = TextEditingController();
  final TextEditingController ftController = TextEditingController();
  final TextEditingController inController = TextEditingController();

  void calculateBMI() {
     print("BMI Calculation Started...");

    var wt = wtController.text.toString();
    var ft = ftController.text.toString();
    var Inch = inController.text.toString();

    if (wt.isNotEmpty && ft.isNotEmpty && Inch.isNotEmpty) {
      var iwt = double.parse(wt);
      var ift = double.parse(ft);
      var iInch = double.parse(Inch);

      var tInch = (ift * 12) + iInch;
      var tCm = tInch * 2.54;
      var tm = tCm / 100;
      var bmi = iwt / (tm * tm);

      double idealWeight = 22 * (tm * tm); // 🔥 Ideal weight calculation

      String msg = "";

      if (bmi > 25) {
        msg = "You are Overweight";
        _bgColor = Colors.orange.shade200;
      } else if (bmi < 18) {
        msg = "You are Underweight";
        _bgColor = Colors.red.shade200;
      } else {
        msg = "You are Healthy";
        _bgColor = Colors.green.shade200;
      }

      _result =
      '$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}\nIdeal Weight: ${idealWeight.toStringAsFixed(2)} KG';
     // print("BMI Calculated: $_result");
    } else {
      _result = "Please fill the required blanks";
       //print("Error: Input fields are empty!");
    }

    notifyListeners();
   // print("UI Notified!");
  }
}
