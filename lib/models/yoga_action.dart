class YogaAction {
  final String name;
  final String text;
  final String image;
  final String sound;
  final int defaultDuration;

  YogaAction({
    required this.name,
    required this.text,
    required this.image,
    required this.sound,
    required this.defaultDuration,
  });

  factory YogaAction.fromJson(Map<String, dynamic> json) {
    return YogaAction(
      name: json['name'],
      text: json['text'],
      image: json['image'],
      sound: json['sound'],
      defaultDuration: json['defaultDuration'],
    );
  }
}
