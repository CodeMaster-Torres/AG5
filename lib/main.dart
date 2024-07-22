import 'package:flutter/material.dart';
import 'screens/color_picker_screen.dart';
import 'screens/temperature_humidity_chart_screen.dart';
import 'screens/data_storage_screen.dart';
import 'screens/notifications_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/color_picker': (context) => ColorPickerScreen(),
        '/temperature_humidity_chart': (context) => TemperatureHumidityChartScreen(),
        '/data_storage': (context) => DataStorageScreen(),
        '/notifications': (context) => NotificationsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor App Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/color_picker');
              },
              child: Text('Color Picker'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/temperature_humidity_chart');
              },
              child: Text('Temperature & Humidity Chart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/data_storage');
              },
              child: Text('Data Storage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
              child: Text('Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
