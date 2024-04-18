import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_rat/const.dart';
import 'package:gym_rat/data.dart';
import 'package:gym_rat/exercises_list.dart';

class BodyMuscleList extends StatefulWidget {
  BodyMuscleList({
    super.key,
  });

  @override
  _BodyMuscleListState createState() => _BodyMuscleListState();
}

class _BodyMuscleListState extends State<BodyMuscleList> {
  final List<String> areaFilter = ["upper", "lower", "core"];
  List<String> selectedAreas = [];

  @override
  Widget build(BuildContext context) {
    final filteredBodymuscle = bodyMuscles.where((muscles) {
      return selectedAreas.isEmpty ||
          selectedAreas.contains(muscles.targetArea.name);
    }).toList();
    return Scaffold(
      backgroundColor: primary2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primary1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: areaFilter
                .map(
                  (area) => FilterChip(
                    side: const BorderSide(color: priText1),
                    backgroundColor: primary2,
                    labelStyle: TextStyle(
                        color:
                            selectedAreas.contains(area) ? primary2 : priText1),
                    label: Text(area),
                    selectedColor: priText2,
                    selected: selectedAreas.contains(area),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedAreas.add(area);
                        } else {
                          selectedAreas.remove(area);
                        }
                      });
                    },
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: primary2,
                    child: ListTile(
                      leading: Image.asset(
                          "assets/images/${filteredBodymuscle[index].muscleName.toLowerCase()}.png"),
                      title: Text(
                        filteredBodymuscle.toList()[index].muscleName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        '${filteredBodymuscle.toList()[index].targetArea.name} body • ${filteredBodymuscle.toList()[index].exercises.length} exercises',
                        style: const TextStyle(color: Colors.white60),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white60,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ExercisesList(
                                exercises:
                                    filteredBodymuscle[index].exercises)));
                      },
                    ));
              },
              itemCount: filteredBodymuscle.length,
            ),
          ),
        ],
      ),
    );
  }
}
