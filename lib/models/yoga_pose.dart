import 'yoga_action.dart';

class YogaPose {
  final YogaAction pose;
  final int duration;

  YogaPose({
    required this.pose,
    int? duration,
  })  : assert(duration == null || duration >= 0),
        duration = duration ?? pose.defaultDuration;
}
