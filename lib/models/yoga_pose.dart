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
    return YogaPose(
      json['actionId'],
      duration: json['duration'],
    );
  }
}
