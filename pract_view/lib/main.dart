import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Example'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: const <Widget>[
            Icon(Icons.ac_unit_sharp, size: 75.0,),
            SizedBox(height: 20.0,),
            Icon(Icons.backpack_outlined, size: 75.0,),
            SizedBox(height: 20.0,),
            Icon(Icons.cabin, size: 75.0,),
            SizedBox(height: 20.0,),
            IconButton(onPressed: (null), icon: Icon(Icons.dangerous_rounded, size: 75.0,))
          ],
        ),
      ),
    );
  }
}

