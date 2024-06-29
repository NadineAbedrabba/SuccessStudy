import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart'; // Import your CustomAppBar widget

class CustomAppBarWithNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAppBar(), // Use your CustomAppBar here
        Positioned(
          top: 90.0, // Adjust position as needed
          right: 40.0, // Adjust position as needed
          child: IconButton(
            icon: Image.asset('assets/images/Notif.png', width: 30, height: 30), // Notification icon
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return NotificationList();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<String> notifications = [
    'Université de Tunis vous a accepté',
    'Vous avez un nouveau message',
    'Votre demande a été approuvée',
    'Notification 4',
    'Notification 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}
