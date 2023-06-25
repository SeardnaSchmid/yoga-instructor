import 'package:flutter/material.dart';

import 'session_screen.dart';
import 'yoga_session.dart';

class SessionDetailsScreen extends StatelessWidget {
  final Session session;

  SessionDetailsScreen({required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              session.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              session.description,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SessionScreen(session: session),
                  ),
                );
              },
              child: const Text('Start Session'),
            ),
          ],
        ),
      ),
    );
  }
}
