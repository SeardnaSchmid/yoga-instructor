import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_instructor/models/yoga_session.dart';
import 'package:yoga_instructor/screens/session_overview.screen.dart';
import 'package:yoga_instructor/session.provider.dart';
import 'package:uuid/uuid.dart';

import '../models/available_yoga_actions.dart';

class SessionsListScreen extends StatelessWidget {
  const SessionsListScreen({Key? key});

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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add logic to navigate to the screen for adding a new session
              },
              child: const Icon(Icons.add),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Available yoga sessions'),
          ),
          body: ListView.separated(
            itemCount: sessions.length,
            separatorBuilder: (context, index) =>
            const Divider(color: Colors.grey),
            itemBuilder: (context, index) {
              final session = sessions[index];

              int totalPoses = session.poses.length;
              int sessionDuration = 0;
              for (var pose in session.poses) {
                sessionDuration +=
                    pose.duration ?? AvailableYogaActions.getDefaultActionDuration(pose.actionId);
              }
              int sessionMinutes = sessionDuration ~/ 60;
              int sessionSeconds = sessionDuration % 60;
              String sessionDurationText =
                  '$sessionMinutes:${sessionSeconds.toString().padLeft(2, '0')}';

              return Dismissible(
                key: Key(session.id),
                direction: DismissDirection.endToStart,
                confirmDismiss: (_) async {
                  return await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirmation'),
                      content: const Text('Are you sure you want to delete this session?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sessionProvider.removeSession(session.id);
                            Navigator.pop(context, true); // Close the dialog and return true
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
                background: Container(
                  color: Colors.red, // Background color when swiping to delete
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SessionOverviewScreen(sessionId: session.id),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              session.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmation'),
                  content: const Text('Are you sure you want to add a new session?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final newSession = Session(
                          id: const Uuid().v4(),
                          name: "New session",
                          description: "New session description",
                          poses: [],
                        );

                        sessionProvider.saveSession(newSession);
                        Navigator.pop(context); // Close the dialog
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
