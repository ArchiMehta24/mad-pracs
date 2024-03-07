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
  String selectedOption = '';

  void handleOptionChange(String value) {
    setState(() {
      selectedOption = value;
    });
  }

  void showPicture() {
    String imageUrl = '';
    String description = '';

    switch (selectedOption) {
      case 'KUALA':
        imageUrl = 'https://t4.ftcdn.net/jpg/02/45/96/03/360_F_245960357_NFiYh2PtgKsKxO6qffV5NDhrkArrBREP.jpg';
        description = 'This is a Kuala.';
        break;
      case 'PENGUIN':
        imageUrl = 'https://www.shutterstock.com/image-vector/cartoon-penguin-icon-vector-illustration-260nw-743328925.jpg';
        description = 'This is a Penguin.';
        break;
      case 'DAFFODIL':
        imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDNyrt54hTJ6n3XgMZAxGa4skTwyIX6hC3kfNe3YB5wg&s';
        description = 'This is a Daffodil.';
        break;
      default:
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PicturePage(imageUrl: imageUrl, description: description),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select an Option'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text('KUALA'),
            value: 'KUALA',
            groupValue: selectedOption,
            onChanged: (value) => handleOptionChange(value!),
          ),
          RadioListTile(
            title: Text('PENGUIN'),
            value: 'PENGUIN',
            groupValue: selectedOption,
            onChanged: (value) => handleOptionChange(value!),
          ),
          RadioListTile(
            title: Text('DAFFODIL'),
            value: 'DAFFODIL',
            groupValue: selectedOption,
            onChanged: (value) => handleOptionChange(value!),
          ),
          ElevatedButton(
            onPressed: selectedOption.isNotEmpty ? showPicture : null,
            child: Text('Show Picture'),
          ),
        ],
      ),
    );
  }
}

class PicturePage extends StatelessWidget {
  final String imageUrl;
  final String description;

  const PicturePage({Key? key, required this.imageUrl, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(description),
          ],
        ),
      ),
    );
  }
}
