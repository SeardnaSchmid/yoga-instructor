class YogaPose {
  final String name;
  final String text;
  final int duration;
  final String image;
  final String sound;

  YogaPose({
    required this.name,
    required this.text,
    required this.duration,
    required this.image,
    required this.sound,
  });

  factory YogaPose.fromJson(Map<String, dynamic> json) {
    return YogaPose(
      name: json['name'],
      text: json['text'],
      duration: json['duration'],
      image: json['image'],
      sound: json['sound'],
    );
  }
}
