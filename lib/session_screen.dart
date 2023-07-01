import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'models/available_yoga_actions.dart';
import 'models/yoga_pose.dart';
import 'models/yoga_session.dart';
import 'pose_widget.dart';

class SessionScreen extends StatefulWidget {
  final Session session;

  const SessionScreen({Key? key, required this.session}) : super(key: key);

  @override
  SessionScreenState createState() => SessionScreenState();
}

class SessionScreenState extends State<SessionScreen> {
  int currentPoseIndex = 0;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    Wakelock.enable();
    playPoseSound(widget.session.poses[currentPoseIndex]);
  }

  @override
  void dispose() {
    super.dispose();
    Wakelock.disable();
  }

  void goToNextPose() {
    if (currentPoseIndex < widget.session.poses.length - 1) {
      setState(() {
        currentPoseIndex++;
      });
      playPoseSound(widget.session.poses[currentPoseIndex]);
    } else {
      // All poses finished
      // Close the session screen
      _audioPlayer.play(AssetSource('sounds/meditation-bowl-success.mp3'));
      Wakelock.disable();
      Navigator.pop(context);
    }
  }

  void playPoseSound(YogaPose pose) {
    _audioPlayer.play(AssetSource(AvailableYogaActions.getAction(pose.actionId).sound));
  }

  @override
  Widget build(BuildContext context) {
    YogaPose currentPose = widget.session.poses[currentPoseIndex];
    int totalPoses = widget.session.poses.length + 1;
    int posesCompleted = currentPoseIndex + 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(AvailableYogaActions.getAction(currentPose.actionId).name),
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
