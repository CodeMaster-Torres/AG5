class SensorData {
  final int id;
  final double temperature;
  final double humidity;
  final DateTime timestamp;

  SensorData({required this.id, required this.temperature, required this.humidity, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'temperature': temperature,
      'humidity': humidity,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
