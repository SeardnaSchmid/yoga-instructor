import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_instructor/models/available_yoga_actions.dart';
import '../widgets/yoga_pose.widget.dart';
import 'session_edit.screen.dart';
import 'session_progression.screen.dart';
import '../session.provider.dart';

class SessionOverviewScreen extends StatelessWidget {
  final String sessionId;

  const SessionOverviewScreen({Key? key, required this.sessionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (context, sessionProvider, _) {
        final session = sessionProvider.getSessionById(sessionId);
        if (session == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Session Overview'),
            ),
            body: const Center(
              child: Text('Session not found'),
            ),
          );
        }

        int totalPoses = session.poses.length;
        int sessionDuration = 0;
        for (var pose in session.poses) {
          sessionDuration += AvailableYogaActions.getDefaultActionDuration(pose.actionId);
        }
        int sessionMinutes = sessionDuration ~/ 60;
        int sessionSeconds = sessionDuration % 60;

        String sessionDurationText = '$sessionMinutes:${sessionSeconds.toString().padLeft(2, '0')}';

        return Scaffold(
          appBar: AppBar(
            title: const Text('Session Overview'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  session.description,
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  'Session Duration: $sessionDurationText',
                  style: const TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Number of Poses: $totalPoses',
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Session Poses:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ListView.separated(
                    itemCount: session.poses.length,
                    separatorBuilder: (context, index) => const Divider(color: Colors.grey),
                    itemBuilder: (context, index) {
                      var pose = session.poses[index];
                      var action = AvailableYogaActions.getAction(pose.actionId);
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: const Text("Pose Details"),
                              ),
                              body: YogaPoseWidget(pose: pose),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(action.image),
                          ),
                          title: Text(action.name),
                          subtitle: Text('Duration: ${pose.duration ?? action.defaultDuration} seconds'),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 75,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SessionEditScreen(session: session),
                              ),
                            );
                          },
                          child: const Text('Edit Session'),
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SessionProgressionScreen(session: session),
                              ),
                            );
                          },
                          child: const Text('Start Session'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
