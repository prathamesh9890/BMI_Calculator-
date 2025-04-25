import 'package:bmi_calculator/provider/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'BMI Calculator App',
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      backgroundColor: context.watch<BmiProvider>().bgColor, // Updates UI when color changes
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: Colors.pinkAccent,
                ),
              ),
              const SizedBox(height: 21),
              TextField(
                controller: bmiProvider.wtController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Weight (In KGs)',
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => bmiProvider.calculateBMI(),
              ),
              const SizedBox(height: 11),
              TextField(
                controller: bmiProvider.ftController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Height (In Feet)',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => bmiProvider.calculateBMI(),
              ),
              const SizedBox(height: 11),
              TextField(
                controller: bmiProvider.inController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Height (In Inches)',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => bmiProvider.calculateBMI(),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: bmiProvider.calculateBMI,
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Consumer<BmiProvider>(
                builder: (context, bmiProvider, child) {
                  return Text(
                    bmiProvider.result,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
