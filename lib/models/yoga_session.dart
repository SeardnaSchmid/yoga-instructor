import 'yoga_pose.dart';

class Session {
  final String name;
  final String description;
  final List<YogaPose> poses;

  Session({
    required this.name,
    required this.description,
    required this.poses,
  });

  // @override
  // String toString() {
  //     print('Session: $name');
  //     print('Description: $description');
  //     print('Poses:');
  //     for (var i = 0; i < poses.length; i++) {
  //       var pose = poses[i];
  //       print('Pose ${i + 1}: ${pose.action.name} (${pose.duration} seconds)');
  //     }
  //   return 'Session: { name: $name, description: $description, poses: $poses }';
  // }
}
