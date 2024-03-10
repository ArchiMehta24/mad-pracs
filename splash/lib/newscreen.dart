//newscreen.dart
import 'package:flutter/material.dart';
import 'package:splash/conti.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContinentScreen(continent: 'Asia')),
                );
              },
            ),
            Text('asia'),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ContinentScreen(continent: 'Australia')),
                );
              },
            ),
            Text('australia'),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ContinentScreen(continent: 'Africa')),
                );
              },
            ),
            Text('africa'),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ContinentScreen(continent: 'America')),
                );
              },
            ),
            Text('america'),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ContinentScreen(continent: 'Europe')),
                );
              },
            ),
            Text('Europe'),
          ],
        ),
      ),
    );
  }
}