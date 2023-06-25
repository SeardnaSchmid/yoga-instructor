import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'models/yoga_pose.dart';

class YogaPoseWidget extends StatefulWidget {
  final YogaPose pose;
  final VoidCallback onNextPose;

  const YogaPoseWidget({
    super.key,
    required this.pose,
    required this.onNextPose,
  });

  @override
  YogaPoseWidgetState createState() => YogaPoseWidgetState();
}

class YogaPoseWidgetState extends State<YogaPoseWidget> {
  late CountDownController _countDownController;

  @override
  void initState() {
    super.initState();
    _countDownController = CountDownController();
    startTimer();
  }

  void startTimer() {
    _countDownController.restart();
  }

  void handleTimerCompletion() {
    _countDownController.restart();

    widget.onNextPose();
  }

  void resetTimer() {
    _countDownController.restart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.pose.action.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.pose.action.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.pose.action.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircularCountDownTimer(
                  duration: widget.pose.duration,
                  controller: _countDownController,
                  width: 200,
                  height: 200,
                  fillColor: Colors.grey,
                  ringColor: Colors.blueAccent,
                  backgroundColor: Colors.transparent,
                  strokeWidth: 10.0,
                  textStyle: const TextStyle(
                    fontSize: 48.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  isReverse: true,
                  onComplete: handleTimerCompletion,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
