import 'package:flutter/material.dart';

import 'models/yoga_pose.dart';
import 'models/yoga_session.dart';
import 'session_list_screen.dart';
import 'yoga_actions.dart';

void main() {
  runApp(const YogaWorkoutApp());
}

class ExampleSessions {
  static Session session1 = Session(
    name: 'Morning Stretch!',
    description: 'A gentle yoga session to wake up your body and mind.',
    poses: [
      YogaPose(YogaActions.startPreparation),
      YogaPose(YogaActions.simpleSit),
      YogaPose(YogaActions.seatedTwistRight),
      YogaPose(YogaActions.seatedTwistLeft),
      YogaPose(YogaActions.allFoursPose),
      YogaPose(YogaActions.plankPose),
      YogaPose(YogaActions.cobraPose),
      YogaPose(YogaActions.childsPose),
      YogaPose(YogaActions.downwardFacingDog),
      YogaPose(YogaActions.deepLungeRight),
      YogaPose(YogaActions.warrior2Right),
      YogaPose(YogaActions.peacefulWarriorRight),
      YogaPose(YogaActions.downwardFacingDog),
      YogaPose(YogaActions.deepLungeLeft),
      YogaPose(YogaActions.warrior2Left),
      YogaPose(YogaActions.peacefulWarriorLeft),
      YogaPose(YogaActions.downwardFacingDog),
      YogaPose(YogaActions.standingForwardBend),
      YogaPose(YogaActions.armsOverhead),
      YogaPose(YogaActions.standingForwardBend),
      YogaPose(YogaActions.downwardFacingDog),
      YogaPose(YogaActions.supineKneeBend),
      YogaPose(YogaActions.supineKneeBend),
      YogaPose(YogaActions.morningStretch),
      YogaPose(YogaActions.kneesToChest),
      YogaPose(YogaActions.corpsePose),
      YogaPose(YogaActions.kneesToChest),
      YogaPose(YogaActions.endCooldown),
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
