import 'package:flutter/material.dart';

import 'yoga_pose.dart';
import 'yoga_session.dart';
import 'session_list_screen.dart';

void main() {
  runApp(const YogaWorkoutApp());
}

class ExampleSessions {
  static final YogaPose pose1 = YogaPose(
    name: 'Mountain Pose',
    text: 'Stand tall with your feet together and...',
    duration: 5,
    image: 'assets/images/mountain.jpg',
    sound: 'assets/mountain_pose_sound.mp3',
  );

  static final YogaPose pose2 = YogaPose(
    name: 'Downward Facing Dog',
    text: 'Start on your hands and knees...',
    duration: 3,
    image: 'assets/images/DownwardDog.jpg',
    sound: 'assets/downward_facing_dog_sound.mp3',
  );

  static final YogaPose pose3 = YogaPose(
    name: 'Child\'s Pose',
    text: 'Sit back on your heels and rest your...',
    duration: 4,
    image: 'assets/images/child.jpg',
    sound: 'assets/child_pose_sound.mp3',
  );

  static Session session1 = Session(
    name: 'Morning Stretch',
    description: 'A gentle yoga session to wake up your body and mind.',
    poses: [pose1, pose2, pose3],
  );

  static Session session2 = Session(
    name: 'Evening Relaxation',
    description: 'A calming yoga session to unwind and relax before bed.',
    poses: [pose3, pose1, pose2],
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
      home: SessionListScreen(sessions: [ExampleSessions.session1, ExampleSessions.session2]),
    );
  }
}
