import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_rat/const.dart';
import 'package:gym_rat/data.dart';
import 'package:gym_rat/models/body_muscle.dart';

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
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                // final area = filteredBodymuscle[index];
                return Card(
                  color: primary2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/app-logo.png",
                          width: 100,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredBodymuscle.toList()[index].muscleName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${filteredBodymuscle.toList()[index].targetArea.name} body •',
                                    style:
                                        const TextStyle(color: Colors.white60),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${filteredBodymuscle.toList()[index].exercises.length} exercises',
                                    style:
                                        const TextStyle(color: Colors.white60),
                                  ),
                                ],
                              ),
                            ]),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.transparent,
              ),
              itemCount: filteredBodymuscle.length,
            ),
          ),
        ],
      ),
    );
  }
}
