import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Progress Indicator Example',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Mude a cor do tema
      ),
      home: ProgressScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double _progressValue = 0.0;

  void _incrementProgress() {
    setState(() {
      if (_progressValue < 1.0) {
        _progressValue += 0.1; // Increment by 10%
        if (_progressValue > 1.0) {
          // Ensure it doesn't exceed 1.0
          _progressValue = 1.0;
        }
      }
    });
  }

  Color _getProgressColor() {
    if (_progressValue < 0.4) {
      return Colors.deepOrangeAccent; // Use uma cor diferente
    } else if (_progressValue < 0.75) {
      return Colors.yellowAccent; // Use uma cor diferente
    } else {
      return Colors.lightGreenAccent; // Use uma cor diferente
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circular Progress Indicator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100, // Adjust size as needed
              height: 150, // Aumente o tamanho do indicador
              child: CircularProgressIndicator(
                value: _progressValue,
                strokeWidth: 8, // Adjust thickness
                backgroundColor: Colors.grey[300], // Background color
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getProgressColor(),
                ), // Progress color based on value
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${(_progressValue * 100).toStringAsFixed(0)}%', // Display progress as percentage
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // Adicione um botão para iniciar a progressão
              onPressed: _progressValue < 1.0 ? _incrementProgress : null,
              child: Text('Iniciar Progressão'),
            ),
          ],
        ),
      ),
    );
  }
}
