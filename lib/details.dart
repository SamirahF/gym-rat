import 'package:flutter/material.dart';
import 'package:gym_rat/const.dart';
import 'package:gym_rat/models/exercise.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Details extends StatefulWidget {
  Details({super.key, required this.exercise});
  final Exercise exercise;

  @override
  _DetailsState createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<Details> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: widget.exercise.getYoutubeID(),
        flags: const YoutubePlayerFlags(
            autoPlay: false, mute: false, isLive: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                    playedColor: Colors.amber, handleColor: Colors.amberAccent),
              ),
              builder: (context, player) {
                return Container(
                  child: player,
                );
              }),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 5, 5),
            child: const Text(
              "Demo & Instructions",
              style: TextStyle(color: Colors.white70, fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 5, 5),
            child: Text(
              widget.exercise.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 5, 5),
            child: Text(
              widget.exercise.description,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
