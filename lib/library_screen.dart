import 'package:flutter/material.dart';
import 'package:gym_rat/models/body_muscle.dart';
import 'package:gym_rat/models/exercise.dart';
import 'package:gym_rat/models/exercises_list.dart';

class LibraryScreen extends StatelessWidget {
  LibraryScreen({super.key});

  final List<BodyMuscle> bodyMuscles = [
    BodyMuscle(muscleName: "Chest", targetArea: Area.upper, exercises: [
      Exercise(
        name: "Bench Press",
        description:
            "The bench press, or chest press, is a weight training exercise where a person presses a weight upwards while lying horizontally on a weight training bench.",
        youtubeURL: "https://www.youtube.com/watch?v=KjYak5vZO9s",
      ),
      Exercise(
          name: "Incline dumbbell press",
          description:
              "The incline dumbbell press is the dumbbell variation of the barbell incline bench press and uses an incline or adjustable bench rather than an incline bench rack.",
          youtubeURL: "https://www.youtube.com/watch?v=oZVCBM9f8Eo"),
      Exercise(
          name: "Dumbbell Flyes",
          description:
              "The dumbbell fly, also known as the dumbbell chest fly, is an upper body exercise that works muscle groups in your chest, shoulders, and arms.",
          youtubeURL: "https://www.youtube.com/watch?v=gasK_1fNVdk"),
      Exercise(
          name: "Cable Crossover ",
          description:
              "Cable crossovers target the pectoralis major muscles' sternal heads, found in the bottom of your chest as well as activating muscles in your shoulder and back.",
          youtubeURL: "https://www.youtube.com/watch?v=taI4XduLpTk"),
      Exercise(
          name: "Push Ups",
          description:
              "a conditioning exercise performed in a prone position by raising and lowering the body with the straightening and bending of the arms while keeping the back straight and supporting the body on the hands and toes",
          youtubeURL: "https://www.youtube.com/watch?v=IODxDxX7oi4"),
      Exercise(
          name: "Floor Press",
          description:
              "The floor press is much more than a “lesser” bench press! It is a great exercise for building upper body strength, burning fat and preventing injury",
          youtubeURL: "https://www.youtube.com/watch?v=WvtcPhPZLAs"),
      Exercise(
          name: "Tricep Bench Press",
          description:
              " Perform bench dips by sitting on a bench or elevated surface with your lower body extended to the floor in front of you. While placing your hands shoulder-width apart on the edge of the bench, slowly lower your body until your upper arm and forearm form a 90-degree angle.",
          youtubeURL: "https://www.youtube.com/watch?v=0326dy_-CzM")
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return ExercisesList(exercises: bodyMuscles[0].exercises);
  }
}
