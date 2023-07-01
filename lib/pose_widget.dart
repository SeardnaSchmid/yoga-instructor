import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'models/yoga_action.dart';
import 'models/yoga_pose.dart';
import 'models/available_yoga_actions.dart';

class YogaPoseWidget extends StatefulWidget {
  final YogaPose pose;
  final VoidCallback onNextPose;

  const YogaPoseWidget({
    Key? key,
    required this.pose,
    required this.onNextPose,
  }) : super(key: key);

  @override
  YogaPoseWidgetState createState() => YogaPoseWidgetState();
}

class YogaPoseWidgetState extends State<YogaPoseWidget> {
  late CountDownController _countDownController;
  bool isTimerRunning = true;
  late String stopButtonText;

  @override
  void initState() {
    super.initState();
    _countDownController = CountDownController();
    startTimer();
    stopButtonText = isTimerRunning ? 'Pause' : 'Continue';
  }

  @override
  void didUpdateWidget(YogaPoseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pose != oldWidget.pose) {
      resetTimer();
    }
  }

  void startTimer() {
    _countDownController.restart(duration: widget.pose.duration);
  }

  void handleTimerCompletion() {
    _countDownController.restart();
    widget.onNextPose();
  }

  void resetTimer() {
    _countDownController.restart(duration: widget.pose.duration);
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

  void skipPose() {
    resetTimer();
    widget.onNextPose();
  }

  @override
  Widget build(BuildContext context) {
    YogaAction currentAction =
        AvailableYogaActions.getAction(widget.pose.actionId);

    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color of the widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentAction.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    currentAction.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Default Duration: ${currentAction.defaultDuration} seconds',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Pose Duration: ${widget.pose.duration ?? currentAction.defaultDuration} seconds',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(currentAction.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularCountDownTimer(
                duration: widget.pose.duration ?? currentAction.defaultDuration,
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
                onComplete: handleTimerCompletion,
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
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: skipPose,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      minimumSize: const Size(140.0, 60.0),
                      padding: const EdgeInsets.all(12.0),
                    ),
                    child: const Text(
                      'Skip',
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
      ),
    );
  }
}
