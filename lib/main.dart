import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Counter',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: const MyHomePage(title: 'Circular Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  double getLabelFontSize(double screenWidth) {
    if (screenWidth < 600) {
      return 16;
    } else {
      return 20;
    }
  }

  double getCounterFontSize(double screenWidth) {
    if (screenWidth < 600) {
      return 32;
    } else {
      return 40;
    }
  }

  double getSpacing(double screenWidth) {
    if (screenWidth < 600) {
      return 12;
    } else {
      return 20;
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter = (_counter + 1) % 11;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = (_counter - 1) % 11;
      if (_counter < 0) {
        _counter += 11;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: getLabelFontSize(screenWidth)),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: getCounterFontSize(screenWidth),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: getSpacing(screenWidth)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('Decrement'),
                ),
                SizedBox(width: getSpacing(screenWidth)),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
