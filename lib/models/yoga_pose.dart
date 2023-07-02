class YogaPose {
  final String actionId;
  final int? duration;

  YogaPose(this.actionId, {this.duration});

  Map<String, dynamic> toJson() {
    return {
      'actionId': actionId,
      'duration': duration,
    };
  }

  factory YogaPose.fromJson(Map<String, dynamic> json) {
    try {
      final actionId = json['actionId'];
      final duration = json['duration'];

      return YogaPose(
        actionId,
        duration: duration,
      );
    } catch (e) {
      print('Error parsing YogaPose from JSON: $e');
      rethrow; // Rethrow the exception for further debugging
    }
  }
}
