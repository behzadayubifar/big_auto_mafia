import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  final String winner;

  const GameOverPage({Key? key, required this.winner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Over'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Winner: $winner',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (winner == 'mafia')
              Text(
                'Mafia Wins!',
                style: TextStyle(fontSize: 18),
              ),
            if (winner == 'city')
              Text(
                'City Wins!',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
