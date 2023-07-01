import 'package:flutter/material.dart';

import 'models/yoga_session.dart';
import 'session_list_screen.dart';
import 'session_manager.dart';

void main() {
  runApp(const YogaWorkoutApp());
}

class YogaWorkoutApp extends StatelessWidget {
  const YogaWorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga Workout Helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: FutureBuilder<List<Session>>(
          future: SessionManager.loadSessionsFromAsset(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading sessions'));
            } else {
              final sessions = snapshot.data ?? [];
              if (sessions.length < 1) {
                return const Text(
                  'No Sessions Found',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                );
              } else {
                return SessionListScreen(sessions: sessions);
              }
            }
          },
        ),
    );
  }
}
