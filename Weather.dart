import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dự báo thời tiết',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherForecastScreen(),
    );
  }
}

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  TextEditingController _locationController = TextEditingController();
  String _weatherData = '';

  final apiKey = 'f15e0f90186f3d5bda97e20ad6d9f652'; // Khởi tạo API key của bạn ở đây

  void _fetchWeatherData() async {
    final city = _locationController.text;

    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _weatherData = 'Thời tiết tại $city: ${data['weather'][0]['description']}';
      });
    } else {
      setState(() {
        _weatherData = 'Không thể lấy dữ liệu thời tiết. Vui lòng thử lại sau.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dự báo thời tiết'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Nhập tên thành phố',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetchWeatherData,
              child: Text('Lấy dự báo thời tiết'),
            ),
            SizedBox(height: 20),
            Text(
              _weatherData,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
