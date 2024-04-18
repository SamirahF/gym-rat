import 'package:flutter/material.dart';
import 'package:gym_rat/body_muscles.dart';
import 'package:gym_rat/data.dart';
import 'package:gym_rat/models/body_muscle.dart';
import 'package:gym_rat/models/exercise.dart';
// import 'package:gym_rat/exercises_list.dart';

class LibraryScreen extends StatelessWidget {
  LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyMuscleList();
    // ExercisesList(exercises: bodyMuscles[0].exercises);
  }
}
