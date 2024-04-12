import 'package:gym_rat/models/exercise.dart';

enum Area { lower, upper }

class BodyMuscle {
  BodyMuscle(
      {required this.muscleName,
      required this.targetArea,
      required this.exercises});

  final String muscleName;
  final Area targetArea;
  final List<Exercise> exercises;
}
