import 'models/yoga_action.dart';

class YogaActions {
  static final YogaAction startPreparation = YogaAction(
    id: 'startPreparation',
    name: 'Prepare yourself',
    text: 'make yourself comfortable and prepare yourself...',
    defaultDuration: 10,
    image: 'assets/images/prepare.jpg',
    sound: 'assets/mountain_pose_sound.mp3',
  );

  static final YogaAction endCooldown = YogaAction(
    id: 'endCooldown',
    name: 'Cooldown',
    text: 'Namaste - Bring your hands to your heart, lower your gaze. Give yourself a smile and thank yourself for taking the time.',
    defaultDuration: 10,
    image: 'assets/images/cooldown.jpg',
    sound: 'assets/namaste_sound.mp3',
  );

  static final YogaAction mountain = YogaAction(
    id: 'mountain',
    name: 'Mountain Pose',
    text: 'Stand tall with your feet together and...',
    defaultDuration: 5,
    image: 'assets/images/mountain.jpg',
    sound: 'assets/mountain_pose_sound.mp3',
  );

  static final YogaAction downwardFacingDog = YogaAction(
    id: 'downwardFacingDog',
    name: 'Downward Facing Dog',
    text: 'Start on your hands and knees...',
    defaultDuration: 13,
    image: 'assets/images/downwardFacingDog.jpg',
    sound: 'assets/downward_facing_dog_sound.mp3',
  );

  static final YogaAction childsPose = YogaAction(
    id: 'childsPose',
    name: 'Child\'s Pose',
    text: 'Sit back on your heels and rest your...',
    defaultDuration: 16,
    image: 'assets/images/childs.jpg',
    sound: 'assets/child_pose_sound.mp3',
  );

  static final YogaAction warrior1 = YogaAction(
    id: 'warrior1',
    name: 'Warrior I Pose',
    text: 'Step your left foot back and...',
    defaultDuration: 6,
    image: 'assets/images/warrior1.jpg',
    sound: 'assets/warrior1_pose_sound.mp3',
  );

  static final YogaAction treePose = YogaAction(
    id: 'treePose',
    name: 'Tree Pose',
    text: 'Stand tall and shift your weight onto...',
    defaultDuration: 4,
    image: 'assets/images/tree.jpg',
    sound: 'assets/tree_pose_sound.mp3',
  );

  static final YogaAction trianglePose = YogaAction(
    id: 'trianglePose',
    name: 'Triangle Pose',
    text: 'Stand with your feet wide apart and...',
    defaultDuration: 5,
    image: 'assets/images/triangle.jpg',
    sound: 'assets/triangle_pose_sound.mp3',
  );

  static final YogaAction cobraPose = YogaAction(
    id: 'cobraPose',
    name: 'Cobra Pose',
    text: 'Lie face down and place your hands...',
    defaultDuration: 16,
    image: 'assets/images/cobra.jpg',
    sound: 'assets/cobra_pose_sound.mp3',
  );

  static final YogaAction bridgePose = YogaAction(
    id: 'bridgePose',
    name: 'Bridge Pose',
    text: 'Lie on your back with your knees bent...',
    defaultDuration: 5,
    image: 'assets/images/bridge.jpg',
    sound: 'assets/bridge_pose_sound.mp3',
  );

  static final YogaAction seatedForwardBend = YogaAction(
    id: 'seatedForwardBend',
    name: 'Seated Forward Bend',
    text: 'Sit on the floor with your legs...',
    defaultDuration: 5,
    image: 'assets/images/todo.jpg',
    sound: 'assets/seated_forward_bend_sound.mp3',
  );

  static final YogaAction camelPose = YogaAction(
    id: 'camelPose',
    name: 'Camel Pose',
    text: 'Kneel on the floor and place your...',
    defaultDuration: 6,
    image: 'assets/images/camel.jpg',
    sound: 'assets/camel_pose_sound.mp3',
  );

  static final YogaAction allFoursPose = YogaAction(
    id: 'allFoursPose',
    name: 'All-Fours Pose',
    text: 'Kneel on all fours and make the back straight ...',
    defaultDuration: 13,
    image: 'assets/images/allFours.jpg',
    sound: 'assets/camel_pose_sound.mp3',
  );

  static final YogaAction pigeonPose = YogaAction(
    id: 'pigeonPose',
    name: 'Pigeon Pose',
    text: 'Start in a high plank position and...',
    defaultDuration: 4,
    image: 'assets/images/todo.jpg',
    sound: 'assets/pigeon_pose_sound.mp3',
  );

  static final YogaAction boatPose = YogaAction(
    id: 'boatPose',
    name: 'Boat Pose',
    text: 'Sit on the floor with your knees bent...',
    defaultDuration: 4,
    image: 'assets/images/boat.jpg',
    sound: 'assets/boat_pose_sound.mp3',
  );

  static final YogaAction standingForwardBend = YogaAction(
    id: 'standingForwardBend',
    name: 'Standing Forward Bend',
    text: 'Stand tall with your feet together and...',
    defaultDuration: 15,
    image: 'assets/images/todo.jpg',
    sound: 'assets/standing_forward_bend_sound.mp3',
  );

  static final YogaAction chairPose = YogaAction(
    id: 'chairPose',
    name: 'Chair Pose',
    text: 'Stand tall with your feet together...',
    defaultDuration: 4,
    image: 'assets/images/chair.jpg',
    sound: 'assets/chair_pose_sound.mp3',
  );

  static final YogaAction extendedTrianglePose = YogaAction(
    id: 'extendedTrianglePose',
    name: 'Extended Triangle Pose',
    text: 'Stand with your feet wide apart...',
    defaultDuration: 5,
    image: 'assets/images/triangle.jpg',
    sound: 'assets/extended_triangle_pose_sound.mp3',
  );

  static final YogaAction plankPose = YogaAction(
    id: 'plankPose',
    name: 'Plank Pose',
    text: 'Start in a high push-up position...',
    defaultDuration: 16,
    image: 'assets/images/plank.jpg',
    sound: 'assets/plank_pose_sound.mp3',
  );

  static final YogaAction simpleSit = YogaAction(
    id: 'simpleSit',
    name: 'Simple Sit',
    text: 'Sit on the floor with your legs crossed...',
    defaultDuration: 20,
    image: 'assets/images/simpleSit.jpg',
    sound: 'assets/simple_sit_sound.mp3',
  );

  static final YogaAction seatedTwistRight = YogaAction(
    id: 'seatedTwistRight',
    name: 'Seated Twist to the Right',
    text: 'Sit on the floor with your legs extended...',
    defaultDuration: 20,
    image: 'assets/images/seatedTwist.jpg',
    sound: 'assets/seated_twist_right_sound.mp3',
  );

  static final YogaAction seatedTwistLeft = YogaAction(
    id: 'seatedTwistLeft',
    name: 'Seated Twist to the Left',
    text: 'Sit on the floor with your legs extended...',
    defaultDuration: 20,
    image: 'assets/images/seatedTwist.jpg',
    sound: 'assets/seated_twist_right_sound.mp3',
  );

  static final YogaAction deepLungeRight = YogaAction(
    id: 'deepLungeRight',
    name: 'Deep Lunge to the Right',
    text: 'Start in a standing position...',
    defaultDuration: 17,
    image: 'assets/images/deepLunge.jpg',
    sound: 'assets/deep_lunge_right_sound.mp3',
  );

  static final YogaAction deepLungeLeft = YogaAction(
    id: 'deepLungeLeft',
    name: 'Deep Lunge to the Left',
    text: 'Start in a standing position...',
    defaultDuration: 17,
    image: 'assets/images/deepLunge.jpg',
    sound: 'assets/deep_lunge_left_sound.mp3',
  );

  static final YogaAction warrior2Right = YogaAction(
    id: 'warrior2Right',
    name: 'Warrior 2 Right',
    text: 'Start in a standing position...',
    defaultDuration: 20,
    image: 'assets/images/warrior2.jpg',
    sound: 'assets/warrior_2_right_sound.mp3',
  );

  static final YogaAction warrior2Left = YogaAction(
    id: 'warrior2Left',
    name: 'Warrior 2 Left',
    text: 'Start in a standing position...',
    defaultDuration: 20,
    image: 'assets/images/warrior2.jpg',
    sound: 'assets/warrior_2_left_sound.mp3',
  );

  static final YogaAction peacefulWarriorRight = YogaAction(
    id: 'peacefulWarriorRight',
    name: 'Peaceful Warrior Right',
    text: 'Start in a standing position...',
    defaultDuration: 5,
    image: 'assets/images/peacefulWarrior.jpg',
    sound: 'assets/peaceful_warrior_right_sound.mp3',
  );

  static final YogaAction peacefulWarriorLeft = YogaAction(
    id: 'peacefulWarriorLeft',
    name: 'Peaceful Warrior Left',
    text: 'Start in a standing position...',
    defaultDuration: 5,
    image: 'assets/images/peacefulWarrior.jpg',
    sound: 'assets/peaceful_warrior_left_sound.mp3',
  );

  static final YogaAction armsOverhead = YogaAction(
    id: 'armsOverhead',
    name: 'Arms Overhead',
    text: 'Stand tall with your feet hip-width apart...',
    defaultDuration: 13,
    image: 'assets/images/armsOverhead.jpg',
    sound: 'assets/arms_overhead_sound.mp3',
  );

  static final YogaAction supineKneeBend = YogaAction(
    id: 'supineKneeBend',
    name: 'Supine Knee Bend',
    text: 'Lie on your back with your knees bent...',
    defaultDuration: 16,
    image: 'assets/images/supineKneeBend.jpg',
    sound: 'assets/supine_knee_bend_sound.mp3',
  );

  static final YogaAction morningStretch = YogaAction(
    id: 'morningStretch',
    name: 'Morning Stretch',
    text: 'Start your day with gentle stretches...',
    defaultDuration: 10,
    image: 'assets/images/morningStretch.jpg',
    sound: 'assets/morning_stretch_sound.mp3',
  );

  static final YogaAction kneesToChest = YogaAction(
    id: "kneesToChest",
    name: 'Knees to Chest',
    text: 'Lie on your back and hug your knees...',
    defaultDuration: 20,
    image: 'assets/images/kneesToChest.jpg',
    sound: 'assets/knees_to_chest_sound.mp3',
  );

  static final YogaAction corpsePose = YogaAction(
    id: "corpse",
    name: 'Corpse Pose',
    text: 'Lie flat on your back with your legs...',
    defaultDuration: 13,
    image: 'assets/images/corpse.jpg',
    sound: 'assets/corpse_pose_sound.mp3',
  );

// Add more poses here...
}
