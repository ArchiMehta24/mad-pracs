import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'File Reading and Writing',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _data;

  Future<void> _loadData() async {
    final loadedData = await rootBundle.loadString('assets/data.txt');
    setState(() {
      _data = loadedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistent Storage'),
      ),
      body: Center(
          child: SizedBox(
              width: 300,
              child: Text(_data ?? 'Nothing to show',
                  style: const TextStyle(fontSize: 24)))),
      floatingActionButton: FloatingActionButton(
          onPressed: _loadData, child: const Icon(Icons.add)),
    );
  }
}
