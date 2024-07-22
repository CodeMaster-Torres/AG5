import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sensor_app/widgets/temperature_chart.dart';
import 'package:sensor_app/widgets/humidity_chart.dart';

class TemperatureHumidityChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature & Humidity Chart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TemperatureChart(),
          ),
          Expanded(
            child: HumidityChart(),
          ),
        ],
      ),
    );
  }
}
