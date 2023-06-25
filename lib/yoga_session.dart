import 'package:yoga_instructor/yoga_pose.dart';

class Session {
  final String name;
  final String description;
  final List<YogaPose> poses;

  Session({
    required this.name,
    required this.description,
    required this.poses,
  });
}
