import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'session_overview.screen.dart';
import 'package:yoga_instructor/session.provider.dart';

import '../models/available_yoga_actions.dart';

class SessionsListScreen extends StatelessWidget {
  const SessionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (context, sessionProvider, _) {
        final sessions = sessionProvider.sessions;

        if (sessions.isEmpty) {
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
                sessionDuration += pose.duration ?? AvailableYogaActions.getDefaultActionDuration(pose.actionId);
              }
              int sessionMinutes = sessionDuration ~/ 60;
              int sessionSeconds = sessionDuration % 60;
              String sessionDurationText = '$sessionMinutes:${sessionSeconds.toString().padLeft(2, '0')}';

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SessionOverviewScreen(sessionId: session.id),
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
      },
    );
  }
}
