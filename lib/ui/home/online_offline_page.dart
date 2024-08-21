import 'package:auto_mafia/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnlineOfflinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Handle online button press
              },
              icon: Icon(
                Icons.network_check,
                size: 48,
              ),
              label: Text('Online'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Handle offline button press
              },
              icon: Icon(
                Icons.signal_wifi_off,
                size: 48,
              ),
              label: Text('Offline'),
            ),
          ],
        ),
      ),
    );
  }
}
