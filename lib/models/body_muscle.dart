import 'package:gym_rat/models/exercise.dart';

enum Area { lower, upper, core }

class BodyMuscle {
  BodyMuscle({
    required this.muscleName,
    required this.targetArea,
    required this.exercises,
    // required this.imagePath
  });

  final String muscleName;
  final Area targetArea;
  final List<Exercise> exercises;
  // final String imagePath;
}
