class YogaAction {
  final String name;
  final String text;
  final String image;
  final String sound;
  final int defaultDuration;

  static const defaultDurationFallback = 15;

  YogaAction({
    required this.name,
    required this.text,
    this.image = "assets/images/yogaActions/todo.jpg",
    this.sound = 'sounds/todo.mp3',
    this.defaultDuration = defaultDurationFallback,
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'text': text,
      'image': image,
      'sound': sound,
      'defaultDuration': defaultDuration,
    };
  }
}
