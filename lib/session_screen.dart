import 'package:flutter/material.dart';
import 'package:yoga_instructor/pose_widget.dart';

import 'models/yoga_pose.dart';
import 'models/yoga_session.dart';

class SessionScreen extends StatefulWidget {
  final Session session;

  const SessionScreen({super.key, required this.session});

  @override
  SessionScreenState createState() => SessionScreenState();
}

class SessionScreenState extends State<SessionScreen> {
  int currentPoseIndex = 0;

  void goToNextPose() {
    if (currentPoseIndex < widget.session.poses.length - 1) {
      setState(() {
        currentPoseIndex++;
      });
    } else {
      // All poses finished
      // Close the session screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    YogaPose currentPose = widget.session.poses[currentPoseIndex];
    int totalPoses = widget.session.poses.length + 1;
    int posesCompleted = currentPoseIndex + 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(currentPose.pose.name),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(8.0),
          child: LinearProgressIndicator(
            value: posesCompleted / totalPoses,
            minHeight: 16.0,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ),
      body: YogaPoseWidget(
        pose: currentPose,
        onNextPose: goToNextPose,
      ),
    );
  }
}
