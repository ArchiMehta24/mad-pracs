//main.dart
import 'package:flutter/material.dart';
import 'package:my_app/new_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://xaviers.ac/');

void main() => runApp(MaterialApp(home: MyTextButton()));

class MyTextButton extends StatefulWidget {
  const MyTextButton({super.key});

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TextButton demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Icon(Icons.business, size: 100),
              ),
              TextButton(
                child: const Text(
                  "St. Xaviers College Mumbai",
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  _launchUrl();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 2,
                  backgroundColor: Colors.red,
                ),
              ),
              ElevatedButton(
                child: const Text('Open route'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewScreen()),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Change assignment operator from == to =
                    _color =
                        _color == Colors.yellow ? Colors.black : Colors.yellow;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Icon(
                    Icons.alarm,
                    size: 100,
                    color: _color, // Apply color here
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      print('cant launch url');
    }
  }
}
