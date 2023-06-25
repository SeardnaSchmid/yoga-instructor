import 'yoga_action.dart';

class YogaPose {
  final YogaAction action;
  final int duration;

  YogaPose(this.action, {int? duration})
      : assert(duration == null || duration >= 0),
        duration = duration ?? action.defaultDuration;
}
