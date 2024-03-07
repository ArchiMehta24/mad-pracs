import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isVisible = true;
  double valueOfTarget = 150;
  @override
  Widget build(BuildContext context) {
    // List<bool> isSelected = [false, true];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                label: Text(isVisible ? "Hide Image" : "Show image"),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    valueOfTarget = valueOfTarget == 150 ? 300 : 150;
                  });
                },
                label: Text(valueOfTarget == 150 ? "Zoom in " : "Zoom out"),
              ),
            ],
          ),
          Visibility(
              visible: isVisible,
              child: Transform(
                transform: Matrix4.rotationZ(pi * 1 / 4),
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: valueOfTarget),
                    duration: const Duration(milliseconds: 600),
                    builder: (BuildContext context, double size,Widget? child) =>
                      Image.asset('assets/images/rose.jpg',
                      height: size
                    )
                  ),
              )),
        ],
      ),
    );
  }
}
