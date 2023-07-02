import 'package:flutter/material.dart';

import 'models/yoga_action.dart';
import 'models/yoga_pose.dart';
import 'models/available_yoga_actions.dart';

class YogaPoseWidget extends StatelessWidget {
  final YogaPose pose;

  const YogaPoseWidget({
    required this.pose,
  });

  @override
  Widget build(BuildContext context) {
    YogaAction currentAction = AvailableYogaActions.getAction(pose.actionId);

    return Scaffold(
      body: Container(
        color: Colors.white,
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
                    'Pose Duration: ${pose.duration ?? currentAction.defaultDuration} seconds',
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
          ],
        ),
      ),
    );
  }
}
