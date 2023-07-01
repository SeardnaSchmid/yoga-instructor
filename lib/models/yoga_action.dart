class YogaAction {
  final String id;
  final String name;
  final String text;
  final String image;
  final String sound;
  final int defaultDuration;

  YogaAction({
    required this.id,
    required this.name,
    required this.text,
    required this.image,
    required this.sound,
    required this.defaultDuration,
  });

  factory YogaAction.fromJson(Map<String, dynamic> json) {
    return YogaAction(
      id: json['id'],
      name: json['name'],
      text: json['text'],
      image: json['image'],
      sound: json['sound'],
      defaultDuration: json['defaultDuration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'text': text,
      'image': image,
      'sound': sound,
      'defaultDuration': defaultDuration,
    };
  }
}
