import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberCheckerApp());
}

class PrimeNumberCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeNumberCheckerScreen(),
    );
  }
}

class PrimeNumberCheckerScreen extends StatefulWidget {
  @override
  _PrimeNumberCheckerScreenState createState() => _PrimeNumberCheckerScreenState();
}

class _PrimeNumberCheckerScreenState extends State<PrimeNumberCheckerScreen> {
  TextEditingController _numberController = TextEditingController();
  String _resultText = '';

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void _checkPrimeNumber() {
    int number = int.tryParse(_numberController.text) ?? 0;
    if (isPrime(number)) {
      setState(() {
        _resultText = 'Số $number là số nguyên tố.';
      });
    } else {
      setState(() {
        _resultText = 'Số $number không phải là số nguyên tố.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra số nguyên tố'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhập số'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _checkPrimeNumber,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultText,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
