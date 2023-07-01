import 'package:flutter/material.dart';
import 'models/yoga_session.dart';

import 'session_details_screen.dart';
import 'models/available_yoga_actions.dart';

class SessionListScreen extends StatelessWidget {
  final List<Session> sessions; // List of sessions

  const SessionListScreen({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) {
      // Display a message or placeholder content when no sessions are available
      return Scaffold(
        appBar: AppBar(
          title: const Text('Available yoga sessions'),
        ),
        body: const Center(
          child: Text('No sessions available'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available yoga sessions'),
      ),
      body: ListView.separated(
        itemCount: sessions.length,
        separatorBuilder: (context, index) => const Divider(color: Colors.grey),
        itemBuilder: (context, index) {
          final session = sessions[index];

          int totalPoses = session.poses.length;
          int sessionDuration = 0;
          for (var pose in session.poses) {
            sessionDuration += AvailableYogaActions.getDefaultActionDuration(pose.actionId);
          }
          int sessionMinutes = sessionDuration ~/ 60;
          int sessionSeconds = sessionDuration % 60;
          String sessionDurationText = '$sessionMinutes:${sessionSeconds.toString().padLeft(2, '0')}';

          return GestureDetector(
            onTap: () {
              // Navigate to SessionDetailsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SessionDetailsScreen(session: session),
                ),
              );
            },
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Duration: $sessionDurationText'),
                    Text('Poses: $totalPoses'),
                    Text(session.description),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
