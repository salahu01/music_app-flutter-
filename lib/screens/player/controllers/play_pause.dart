// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../functions/functions.dart';

class PlayAndPause extends StatelessWidget {
  PlayAndPause(
      {Key? key,
      required this.buttonsize,this.buttoncolor = Colors.blue}) : super(key: key);
  Color buttoncolor;

  dynamic buttonsize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (PlayerFunctions.player.playing) {
          PlayerFunctions.player.pause();
        } else {
          PlayerFunctions.player.play();
        }
      },
      child: StreamBuilder(
        stream: PlayerFunctions.player.playingStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          bool? playingstate = snapshot.data;
          if (playingstate != null && playingstate) {
            return Icon(Icons.pause_circle,
                color: buttoncolor,
                size: buttonsize,
                );
          } else {
            return Icon(Icons.play_circle,
                color: buttoncolor,
                size: buttonsize,
                );
          }
        },
      ),
    );
  }
}
