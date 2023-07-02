import 'yoga_action.dart';

class AvailableYogaActions {
  static final Map<String, YogaAction> actions = {
    'allFoursPose': YogaAction(
      name: 'All-Fours Pose',
      text: 'Kneel on all fours and make the back straight ...',
      defaultDuration: 13,
      image: 'assets/images/yogaActions/allFours.jpg',
      sound: 'sounds/yogaActions/allFoursPose.mp3',
    ),
    'armsOverhead': YogaAction(
      name: 'Arms Overhead',
      text: 'Stand tall with your feet hip-width apart...',
      defaultDuration: 13,
      image: 'assets/images/yogaActions/armsOverhead.jpg',
      sound: 'sounds/yogaActions/armsOverhead.mp3',
    ),
    'boatPose': YogaAction(
      name: 'Boat Pose',
      text: 'Sit on the floor with your knees bent...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/boat.jpg',
      sound: 'sounds/yogaActions/boatPose.mp3',
    ),
    'bridgePose': YogaAction(
      name: 'Bridge Pose',
      text: 'Lie on your back with your knees bent...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/bridge.jpg',
      sound: 'sounds/yogaActions/bridgePose.mp3',
    ),
    'camelPose': YogaAction(
      name: 'Camel Pose',
      text: 'Kneel on the floor and place your...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/camel.jpg',
      sound: 'sounds/yogaActions/camelPose.mp3',
    ),
    'chairPose': YogaAction(
      name: 'Chair Pose',
      text: 'Stand tall with your feet together...',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/chair.jpg',
      sound: 'sounds/yogaActions/chairPose.mp3',
    ),
    'childsPose': YogaAction(
      name: 'Child\'s Pose',
      text: 'Sit back on your heels and rest your...',
      defaultDuration: 16,
      image: 'assets/images/yogaActions/childs.jpg',
      sound: 'sounds/yogaActions/childsPose.mp3',
    ),
    'cobraPose': YogaAction(
      name: 'Cobra Pose',
      text: 'Lie face down and place your hands...',
      defaultDuration: 16,
      image: 'assets/images/yogaActions/cobra.jpg',
      sound: 'sounds/yogaActions/cobraPose.mp3',
    ),
    'cooldown': YogaAction(
      name: 'Cooldown',
      text: 'Namaste - Bring your hands to your heart, lower your gaze. Give yourself a smile and thank yourself for taking the time.',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/cooldown.jpg',
      sound: 'sounds/yogaActions/cooldown.mp3',
    ),
    "corpsePose": YogaAction(
      name: 'Corpse Pose',
      text: 'Lie flat on your back with your legs...',
      defaultDuration: 13,
      image: 'assets/images/yogaActions/corpse.jpg',
      sound: 'sounds/yogaActions/corpsePose.mp3',
    ),
    "corpsePoseVariationKneesBend": YogaAction(
      name: 'Corpse Pose Variation Knees Bend',
      text: 'Lie flat on your back with your legs...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/corpseVariationKneesBend.jpg',
      sound: 'sounds/todo.mp3',
    ),
    'deepLungeLeft': YogaAction(
      name: 'Deep Lunge to the Left',
      text: 'Start in a standing position...',
      defaultDuration: 17,
      image: 'assets/images/yogaActions/deepLunge.jpg',
      sound: 'sounds/yogaActions/deepLungeLeft.mp3',
    ),
    'deepLungeRight': YogaAction(
      name: 'Deep Lunge to the Right',
      text: 'Start in a standing position...',
      defaultDuration: 17,
      image: 'assets/images/yogaActions/deepLunge.jpg',
      sound: 'sounds/yogaActions/deepLungeRight.mp3',
    ),
    'downwardFacingDog': YogaAction(
      name: 'Downward Facing Dog',
      text: 'Start on your hands and knees...',
      defaultDuration: 13,
      image: 'assets/images/yogaActions/downwardFacingDog.jpg',
      sound: 'sounds/yogaActions/downwardFacingDog.mp3',
    ),
    'extendedTrianglePose': YogaAction(
      name: 'Extended Triangle Pose',
      text: 'Stand with your feet wide apart...',
      defaultDuration: 5,
      image: 'assets/images/yogaActions/triangle.jpg',
      sound: 'sounds/yogaActions/extendedTrianglePose.mp3',
    ),
    "kneesToChest": YogaAction(
      name: 'Knees to Chest',
      text: 'Lie on your back and hug your knees...',
      defaultDuration: 20,
      image: 'assets/images/yogaActions/kneesToChest.jpg',
      sound: 'sounds/yogaActions/kneesToTheChest.mp3',
    ),
    'morningStretch': YogaAction(
      name: 'Morning Stretch',
      text: 'Start your day with gentle stretches...',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/morningStretch.jpg',
      sound: 'sounds/yogaActions/morningStretch.mp3',
    ),
    'mountainPose': YogaAction(
      name: 'Mountain Pose',
      text: 'Stand tall with your feet together and...',
      defaultDuration: 5,
      image: 'assets/images/yogaActions/mountain.jpg',
      sound: 'sounds/yogaActions/mountainPose.mp3',
    ),
    'peacefulWarriorLeft': YogaAction(
      name: 'Peaceful Warrior Left',
      text: 'Start in a standing position...',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/peacefulWarrior.jpg',
      sound: 'sounds/yogaActions/peacefulWarriorLeft.mp3',
    ),
    'peacefulWarriorRight': YogaAction(
      name: 'Peaceful Warrior Right',
      text: 'Start in a standing position...',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/peacefulWarrior.jpg',
      sound: 'sounds/yogaActions/peacefulWarriorRight.mp3',
    ),
    'pigeonPoseLeft': YogaAction(
      name: 'Pigeon Pose left leg in front',
      text: 'Start in a high plank position and...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/todo.jpg',
      sound: 'sounds/yogaActions/pigeonPoseLeft.mp3',
    ),
    'pigeonPoseRight': YogaAction(
      name: 'Pigeon Pose right leg in front',
      text: 'Start in a high plank position and...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/todo.jpg',
      sound: 'sounds/yogaActions/pigeonPoseRight.mp3',
    ),
    'plankPose': YogaAction(
      name: 'Plank Pose',
      text: 'Start in a high push-up position...',
      defaultDuration: 16,
      image: 'assets/images/yogaActions/plank.jpg',
      sound: 'sounds/yogaActions/plankPose.mp3',
    ),
    'prepareYourself': YogaAction(
      name: 'Prepare yourself',
      text: 'make yourself comfortable and prepare yourself...',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/prepare.jpg',
      sound: 'sounds/yogaActions/prepareYourself.mp3',
    ),
    'seatedForwardBend': YogaAction(
      name: 'Seated Forward Bend',
      text: 'Sit on the floor with your legs...',
      defaultDuration: 5,
      image: 'assets/images/yogaActions/todo.jpg',
      sound: 'sounds/yogaActions/seated_forward_bend_sound.mp3',
    ),
    'seatedTwistLeft': YogaAction(
      name: 'Seated Twist to the Left',
      text: 'Sit on the floor with your legs extended...',
      defaultDuration: 20,
      image: 'assets/images/yogaActions/seatedTwist.jpg',
      sound: 'sounds/yogaActions/seatedTwistLeft.mp3',
    ),
    'seatedTwistRight': YogaAction(
      name: 'Seated Twist to the Right',
      text: 'Sit on the floor with your legs extended...',
      defaultDuration: 20,
      image: 'assets/images/yogaActions/seatedTwist.jpg',
      sound: 'sounds/yogaActions/seatedTwistRight.mp3',
    ),
    'simpleSit': YogaAction(
      name: 'Simple Sit',
      text: 'Sit on the floor with your legs crossed...',
      defaultDuration: 20,
      image: 'assets/images/yogaActions/simpleSit.jpg',
      sound: 'sounds/yogaActions/simpleSit.mp3',
    ),
    'standingForwardBend': YogaAction(
      name: 'Standing Forward Bend',
      text: 'Stand tall with your feet together and...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/standigForwardBend.jpg',
      sound: 'sounds/yogaActions/standigForwardBend.mp3',
    ),
    'supineKneeBendLeft': YogaAction(
      name: 'Supine Knee Bend Left',
      text: 'Lie on your back with your knees bent...',
      defaultDuration: 16,
      image: 'assets/images/yogaActions/supineKneeBend.jpg',
      sound: 'sounds/yogaActions/supineKneeBendLeft.mp3',
    ),
    'supineKneeBendRight': YogaAction(
      name: 'Supine Knee Bend',
      text: 'Lie on your back with your knees bent...',
      defaultDuration: 16,
      image: 'assets/images/yogaActions/supineKneeBend.jpg',
      sound: 'sounds/yogaActions/supineKneeBendRight.mp3',
    ),
    'treePose': YogaAction(
      name: 'Tree Pose',
      text: 'Stand tall and shift your weight onto...',
      defaultDuration: 4,
      image: 'assets/images/yogaActions/tree.jpg',
      sound: 'sounds/yogaActions/treePose.mp3',
    ),
    'warrior1Left': YogaAction(
      name: 'Warrior I Pose Left',
      text: 'Step your left foot back and...',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/warrior1.jpg',
      sound: 'sounds/yogaActions/warrior1Left.mp3',
    ),
    'warrior1Right': YogaAction(
      name: 'Warrior I Pose Right',
      text: 'Step your left foot back and...',
      defaultDuration: 10,
      image: 'assets/images/yogaActions/warrior1.jpg',
      sound: 'sounds/yogaActions/warrior1Right.mp3',
    ),
    'standingHalfForwardBend': YogaAction(
      name: 'Standing Half Forward Bend',
      text: 'Stand tall with your feet together and...',
      defaultDuration: 15,
      image: 'assets/images/yogaActions/todo.jpg',
      sound: 'sounds/yogaActions/todo.mp3',
    ),
    'warrior2Left': YogaAction(
      name: 'Warrior 2 Left',
      text: 'Start in a standing position...',
      defaultDuration: 20,
      image: 'assets/images/yogaActions/warrior2.jpg',
      sound: 'sounds/yogaActions/warrior2Left.mp3',
    ),
    'warrior2Right': YogaAction(
      name: 'Warrior 2 Right',
      text: 'Start in a standing position...',
      defaultDuration: 20,
      image: 'assets/images/yogaActions/warrior2.jpg',
      sound: 'sounds/yogaActions/warrior2Right.mp3',
    ),
  };

  static YogaAction getAction(String actionId) {
    var yogaActionNotFoundFallback = YogaAction(
      name: "$actionId is not yet implemented. Or it is the wrong actionId. Contact the developer",
      text: '$actionId is not yet implemented. Or it is the wrong actionId. Contact the developer',
    );
    return actions[actionId] ?? yogaActionNotFoundFallback;
  }

  // Get default duration of a YogaAction by ID
  static int getDefaultActionDuration(String id) {
    final YogaAction? action = actions[id];
    var defaultDurationFallback = 10;
    return action?.defaultDuration ?? defaultDurationFallback;
  }
}
