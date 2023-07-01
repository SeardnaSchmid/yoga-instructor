import 'package:flutter/material.dart';
import 'package:yoga_instructor/yoga_actions.dart';

import 'session_screen.dart';
import 'models/yoga_session.dart';

class SessionDetailsScreen extends StatelessWidget {
  final Session session;

  const SessionDetailsScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    int totalPoses = session.poses.length;
    int sessionDuration = 0;
    for (var pose in session.poses) {
       sessionDuration += YogaActions.getDefaultActionDuration(pose.actionId);
    }
    int sessionMinutes = sessionDuration ~/ 60;
    int sessionSeconds = sessionDuration % 60;

    String sessionDurationText = '$sessionMinutes:${sessionSeconds.toString().padLeft(2, '0')}';

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
            Text(
              'Session Duration: $sessionDurationText',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Number of Poses: $totalPoses',
              style: const TextStyle(fontSize: 16.0),
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
