import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedGender = 'Male';
  String _greetingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField(
              value: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value.toString();
                });
              },
              items: ['Male', 'Female']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _generateGreeting();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GreetingPage(
                      name: _nameController.text,
                      gender: _selectedGender,
                      greeting: _greetingMessage,
                    ),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _generateGreeting() {
    String name = _nameController.text;
    if (_selectedGender == 'Male') {
      _greetingMessage = 'Hello Mr. $name, ${_getRandomGreeting()}';
    } else {
      _greetingMessage =
          'Hello Ms. $name, ${_getWomenDayMessage()}, ${_getRandomGreeting()}';
    }
  }

  String _getRandomGreeting() {
    final greetings = [
      'have a wonderful day!',
      'hope you are doing great!',
      'wishing you all the best!',
      'may your day be filled with joy!',
      'sending you positive vibes!'
    ];
    return greetings[Random().nextInt(greetings.length)];
  }

  String _getWomenDayMessage() {
    return "Happy International Women's Day! You are strong, resilient, and invaluable. Keep shining!";
  }
}

class GreetingPage extends StatelessWidget {
  final String name;
  final String gender;
  final String greeting;

  const GreetingPage({
    required this.name,
    required this.gender,
    required this.greeting,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greetings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Name: ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(width: 10.0),
                Image.asset(
                  'assets/flower.png',
                  width: 30.0,
                  height: 30.0,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              greeting,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}