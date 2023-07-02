import 'yoga_pose.dart';

class Session {
  final String id; // New field
  final String name;
  final String description;
  final List<YogaPose> poses;

  Session({
    required this.id,
    required this.name,
    required this.description,
    required this.poses,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    try {
      final List<dynamic> posesJson = json['poses'];
      final List<YogaPose> poses = posesJson.map((poseJson) => YogaPose.fromJson(poseJson)).toList();

      return Session(
        id: json['id'], // Assigning value to id field
        name: json['name'],
        description: json['description'],
        poses: poses,
      );
    } catch (e) {
      print('Error parsing Session from JSON: $e');
      rethrow; // Rethrow the exception for further debugging
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'poses': poses.map((pose) => pose.toJson()).toList(),
    };
  }
}
