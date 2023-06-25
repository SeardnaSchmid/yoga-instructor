import 'package:flutter/material.dart';
import 'package:yoga_instructor/yoga_poses.dart';

import 'models/yoga_session.dart';
import 'session_list_screen.dart';

void main() {
  runApp(const YogaWorkoutApp());
}

class ExampleSessions {
  static Session session1 = Session(
    name: 'Morning Stretch',
    description: 'A gentle yoga session to wake up your body and mind.',
    poses: [
      YogaPoses.childsPose,
      YogaPoses.mountain,
      YogaPoses.downwardFacingDog
    ],
  );

  static Session session2 = Session(
    name: 'Evening Relaxation',
    description: 'A calming yoga session to unwind and relax before bed.',
    poses: [
      YogaPoses.childsPose,
      YogaPoses.mountain,
      YogaPoses.downwardFacingDog,
      YogaPoses.childsPose,
      YogaPoses.mountain,
      YogaPoses.downwardFacingDog
    ],
  );
}

class YogaWorkoutApp extends StatelessWidget {
  const YogaWorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga Workout Helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SessionListScreen(
          sessions: [ExampleSessions.session1, ExampleSessions.session2]),
    );
  }
}
