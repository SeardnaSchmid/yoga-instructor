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

  factory Session.fromJson(Map<String, dynamic> json) {
    final List<dynamic> posesData = json['poses'];
    final List<YogaPose> poses = posesData.map((pose) => YogaPose.fromJson(pose)).toList();

    return Session(
      name: json['name'],
      description: json['description'],
      poses: poses,
    );
  }
}
