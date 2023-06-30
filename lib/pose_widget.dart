import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'models/yoga_pose.dart';

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
    stopButtonText = isTimerRunning ? 'Stop' : 'Continue';
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
    return Scaffold(
      body: Container(
        color: Colors.grey, // Set the background color of the widget
        child: Center(
          child: Stack(
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
                    Center(
                      child: Text(
                        widget.pose.action.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            widget.pose.action.text,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            widget.pose.action.defaultDuration.toString(),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            widget.pose.duration.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.6,
                // Adjust this value to move the countdown timer down
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      isReverse: true,
                      onComplete: handleTimerCompletion,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
