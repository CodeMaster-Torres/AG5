import 'package:flutter/material.dart';
import 'package:sensor_app/services/database_service.dart';
import 'package:sensor_app/models/sensor_data.dart';

class DataStorageScreen extends StatefulWidget {
  @override
  _DataStorageScreenState createState() => _DataStorageScreenState();
}

class _DataStorageScreenState extends State<DataStorageScreen> {
  List<SensorData> sensorDataList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var data = await DatabaseService().getAllSensorData();
    setState(() {
      sensorDataList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Storage'),
      ),
      body: ListView.builder(
        itemCount: sensorDataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Temperature: ${sensorDataList[index].temperature}'),
            subtitle: Text('Humidity: ${sensorDataList[index].humidity}'),
          );
        },
      ),
    );
  }
}
