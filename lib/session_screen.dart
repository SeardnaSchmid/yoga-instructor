import 'package:flutter/material.dart';
import 'package:yoga_instructor/pose_widget.dart';
import 'package:yoga_instructor/yoga_pose.dart';

import 'yoga_session.dart';

class SessionScreen extends StatefulWidget {
  final Session session;

  SessionScreen({required this.session});

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
      // Session finished
      // Handle session completion logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    YogaPose currentPose = widget.session.poses[currentPoseIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentPose.name),
      ),
      body: PoseWidget(
        pose: currentPose,
        onNextPose: goToNextPose,
      ),
    );
  }
}
