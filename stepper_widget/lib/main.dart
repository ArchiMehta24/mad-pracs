import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VerticalStepper(),
  ));
}

class VerticalStepper extends StatefulWidget {
  const VerticalStepper({super.key});

  @override
  State<VerticalStepper> createState() => _VerticalStepperState();
}

class _VerticalStepperState extends State<VerticalStepper> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        currentStep: _index,
        steps: <Step> [
          Step(
            isActive: _index == 0,
            title: const Text("Create Account"),
            content: const Text("first step"),
          ),
          Step(
              isActive: _index == 1,
              title: const Text("Register yourself"),
              content: const Text("Second step")),
          Step(
              isActive: _index == 2,
              title: const Text("verify yourself"),
              content: const Text("Third step")),
          Step(
              isActive: _index == 3,
              title: const Text("do it yourself"),
              content: const Text("Fourth step")),
        ],
        onStepContinue: () {
          if (_index < 3) {
            setState(() {
              _index += 1;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("This was the last step")));
          }
        },
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("can't go back")));
          }
        },
        onStepTapped: (idx) {
          _index = idx;
        },
      ),
    );
  }
}