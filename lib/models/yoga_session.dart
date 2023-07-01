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
    final List<dynamic> posesJson = json['poses'];
    final List<YogaPose> poses = posesJson.map((poseJson) => YogaPose.fromJson(poseJson)).toList();

    return Session(
      name: json['name'],
      description: json['description'],
      poses: poses,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'poses': poses.map((pose) => pose.toJson()).toList(),
    };
  }
}
