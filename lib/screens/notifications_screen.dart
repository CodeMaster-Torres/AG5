import 'package:flutter/material.dart';
import 'package:sensor_app/services/notification_service.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotificationService().showNotification(
              title: 'Temperature Alert',
              body: 'Temperature has exceeded 25°C!',
            );
          },
          child: Text('Test Notification'),
        ),
      ),
    );
  }
}
