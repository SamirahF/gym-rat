import 'package:flutter/material.dart';
import 'package:gym_rat/const.dart';
import 'package:gym_rat/details.dart';
import 'package:gym_rat/models/exercise.dart';

class ExercisesList extends StatefulWidget {
  ExercisesList({super.key, required this.exercises});
  final List<Exercise> exercises;
  @override
  _ExercisesList createState() {
    return _ExercisesList();
  }
}

class _ExercisesList extends State<ExercisesList> {
  final TextEditingController _searchController = TextEditingController();
  List<Exercise> filteredExercises = [];

  @override
  void initState() {
    super.initState();
    filteredExercises.addAll(widget.exercises);
  }

  void filterExercises(String query) {
    if (query.isNotEmpty) {
      filteredExercises.clear();
      widget.exercises.forEach((exercise) {
        if (exercise.name.toLowerCase().contains(query)) {
          filteredExercises.add(exercise);
        }
      });
    } else {
      filteredExercises.addAll(widget.exercises);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary2,
        appBar: AppBar(
            backgroundColor: primary1,
            title: TextField(
              onChanged: filterExercises,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Exercise",
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                    filterExercises("");
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            )),
        body: ListView.builder(
          itemCount: filteredExercises.length,
          itemBuilder: (ctx, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(
                          exercise: filteredExercises[index],
                        )),
              );
            },
            child: Card(
              color: primary2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Image.network(
                        width: 100,
                        height: 100,
                        'https://img.youtube.com/vi/${filteredExercises[index].getYoutubeID()}/0.jpg'),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      filteredExercises[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
