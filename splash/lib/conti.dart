//conti.dart
import 'package:flutter/material.dart';
import 'package:splash/flight.dart';

class ContinentScreen extends StatelessWidget {
  final String continent;

  ContinentScreen({required this.continent});

  @override
  Widget build(BuildContext context) {
    List<String> destinations = [];
    // Add images of destinations based on the continent
    if (continent == 'Asia') {
      //destinations = ['destination1.jpg', 'destination2.jpg', 'destination3.jpg'];
      destinations = ['destination1.jpg'];
    } else if (continent == 'Australia') {
      destinations = ['destination4.jpg'];
      //destinations = ['destination4.jpg', 'destination5.jpg', 'destination6.jpg'];
    } else if (continent == 'Africa') {
      destinations = ['destination7.jpg'];
      //destinations = ['destination7.jpg', 'destination8.jpg', 'destination9.jpg'];
    } else if (continent == 'America') {
      destinations = ['destination10.jpg'];
      //destinations = ['destination10.jpg', 'destination11.jpg', 'destination12.jpg'];
    } else if (continent == 'Europe') {
      destinations = ['destination13.jpg'];
      //destinations = ['destination13.jpg', 'destination14.jpg', 'destination15.jpg'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(continent),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: destinations.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FlightDetailsScreen()),
              );
            },
            child: Image.asset(
              'assets/${destinations[index]}',
              height: 30.0,
              width: 20.0,
            ),
          );
        },
      ),
    );
  }
}
