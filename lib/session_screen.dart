import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
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
  late int currentDuration;
  late CountDownController _countDownController;
  bool isTimerRunning = true;
  late String stopButtonText;

  @override
  void initState() {
    super.initState();
    _countDownController = CountDownController();
    _audioPlayer = AudioPlayer();
    Wakelock.enable();

    stopButtonText = isTimerRunning ? 'Pause' : 'Continue';

    var currentPose = widget.session.poses[currentPoseIndex];
    currentDuration = currentPose.duration ??
        AvailableYogaActions.getDefaultActionDuration(currentPose.actionId);
    startTimer();
    playPoseSound(currentPose);
  }

  @override
  void dispose() {
    super.dispose();
    Wakelock.disable();
  }

  void startTimer() {
    _countDownController.restart(duration: currentDuration);
  }

  void toggleTimer() {
    setState(() {
      if (isTimerRunning) {
        _countDownController.pause();
      } else {
        _countDownController.resume();
      }
      isTimerRunning = !isTimerRunning;
      stopButtonText = isTimerRunning ? 'Stop' : 'Continue';
    });
  }

  void onNextPose() {
    if (currentPoseIndex < widget.session.poses.length - 1) {
      setState(() {
        currentPoseIndex++;
        var currentPose = widget.session.poses[currentPoseIndex];
        currentDuration = currentPose.duration ??
            AvailableYogaActions.getDefaultActionDuration(currentPose.actionId);
      });
      _countDownController.restart(duration: currentDuration);
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
    _audioPlayer
        .play(AssetSource(AvailableYogaActions.getAction(pose.actionId).sound));
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
      body: Column(
        children: [
          Expanded(
            child: YogaPoseWidget(pose: currentPose),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularCountDownTimer(
              duration: currentDuration,
              controller: _countDownController,
              width: 100,
              height: 100,
              fillColor: Colors.grey,
              ringColor: Colors.blueAccent,
              backgroundColor: Colors.transparent,
              strokeWidth: 10.0,
              textStyle: const TextStyle(
                fontSize: 48.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              isReverse: true,
              onComplete: onNextPose,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toggleTimer,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size(140.0, 60.0),
                    padding: const EdgeInsets.all(12.0),
                  ),
                  child: Text(
                    stopButtonText,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onNextPose,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size(140.0, 60.0),
                    padding: const EdgeInsets.all(12.0),
                  ),
                  child: const Text(
                    'Next Pose',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
