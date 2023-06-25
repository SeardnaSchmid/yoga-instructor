import 'package:flutter/material.dart';
import 'package:yoga_instructor/yoga_actions.dart';

import 'models/yoga_pose.dart';
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
      YogaPose(pose: YogaActions.childsPose,duration: 4),
      YogaPose(pose: YogaActions.childsPose,duration: 4),
      YogaPose(pose: YogaActions.childsPose,duration: 4),
      YogaPose(pose: YogaActions.childsPose,duration: 4),
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
          sessions: [ExampleSessions.session1]),
    );
  }
}
