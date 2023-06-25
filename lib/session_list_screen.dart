import 'package:flutter/material.dart';
import 'yoga_session.dart';

import 'session_details_screen.dart';

class SessionListScreen extends StatelessWidget {
  final List<Session> sessions; // List of sessions

  SessionListScreen({required this.sessions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga Sessions'),
      ),
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) {
          final session = sessions[index];
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