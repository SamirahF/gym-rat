import 'package:flutter/material.dart';
import 'package:gym_rat/const.dart';
import 'package:gym_rat/models/exercise.dart';

class ExercisesList extends StatelessWidget {
  const ExercisesList({super.key, required this.exercises});
  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (ctx, index) => Card(
        color: primary2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Image.network(
                  width: 100,
                  height: 100,
                  'https://img.youtube.com/vi/${exercises[index].getYoutubeID()}/0.jpg'),
              const SizedBox(
                width: 20,
              ),
              Text(
                exercises[index].name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
