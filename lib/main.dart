import 'package:bmi_calculator/provider/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const MyHomePage(),
    );
  }
}
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage();
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var wtController = TextEditingController();
//   var ftController = TextEditingController();
//   var inController = TextEditingController();
//
//   var result = '';
//   var bgColor = Colors.pink.shade100;
//
//   void calculateBMI() {
//     var wt = wtController.text.toString();
//     var ft = ftController.text.toString();
//     var Inch = inController.text.toString();
//
//     if (wt != "" && ft != "" && Inch != "") {
//       var iwt = int.parse(wt); // convert string into integer
//       var ift = int.parse(ft); // convert string into integer
//       var iInch = int.parse(Inch); // convert string into integer
//
//       var tInch = (ift * 12) + iInch;
//       var tCm = tInch * 2.54;
//       var tm = tCm / 100;
//       var bmi = iwt / (tm * tm);
//
//       var msg = "";
//
//       if (bmi > 25) {
//         msg = "You are Overweight";
//         bgColor = Colors.orange.shade200;
//       } else if (bmi < 18) {
//         msg = "You are Underweight";
//         bgColor = Colors.red.shade200;
//       } else {
//         msg = "You are Healthy";
//         bgColor = Colors.green.shade200;
//       }
//
//       setState(() {
//         result = '$msg \nYour BMI is: ${bmi.toStringAsFixed(3)}';
//       });
//     } else {
//       setState(() {
//         result = "Please fill the required blanks";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'BMI Calculator App',
//           style: TextStyle(color: Colors.orange),
//         ),
//         centerTitle: true,
//       ),
//
//       backgroundColor: bgColor,
//       body: Center(
//         child: Container(
//           width: 300,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'BMI',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 34,
//                   color: Colors.pinkAccent,
//                 ),
//               ),
//               const SizedBox(height: 21),
//               TextField(
//                 controller: wtController,
//                 decoration: const InputDecoration(
//                   label: Text(
//                     'Enter Your Weight (In KGs)',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   prefixIcon: Icon(Icons.line_weight),
//                 ),
//                 keyboardType: TextInputType.number,
//                 onSubmitted: (_) => calculateBMI(), // Trigger BMI calculation on Enter
//               ),
//               const SizedBox(height: 11),
//               TextField(
//                 controller: ftController,
//                 decoration: const InputDecoration(
//                   label: Text(
//                     'Enter Your Height (In Feet)',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   prefixIcon: Icon(Icons.height),
//                 ),
//                 keyboardType: TextInputType.number,
//                 onSubmitted: (_) => calculateBMI(), // Trigger BMI calculation on Enter
//               ),
//               const SizedBox(height: 11),
//               TextField(
//                 controller: inController,
//                 decoration: const InputDecoration(
//                   label: Text(
//                     'Enter Your Height (In Inches)',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   prefixIcon: Icon(Icons.height),
//                 ),
//                 keyboardType: TextInputType.number,
//                 onSubmitted: (_) => calculateBMI(), // Trigger BMI calculation on Enter
//               ),
//               const SizedBox(height: 18),
//               ElevatedButton(
//                 onPressed: calculateBMI,
//                 child: const Text(
//                   'Calculate',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 result,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
