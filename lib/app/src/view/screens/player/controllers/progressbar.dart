import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/services/functions.dart';
import '../../theme.dart';

class ProgressBarscreen extends StatelessWidget {
  const ProgressBarscreen({Key? key,this.barHeight,this.fontsize,this.thumbRadius}) : super(key: key);
  final double? barHeight;
  final double? fontsize;
  final double?  thumbRadius;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<DurationState>(
          stream: PlayerFunctions.durationStateStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final durationState = snapshot.data;
            final progress = durationState?.position ?? Duration.zero;
            final total = durationState?.total ?? Duration.zero;
            return ProgressBar(
                timeLabelTextStyle:  TextStyle(color: Themecolors.font??Colors.white,fontSize: fontsize ?? 14),
                timeLabelType: TimeLabelType.totalTime,
                progress: progress,
                total: total,
                barHeight: barHeight??3,
                barCapShape: BarCapShape.square,
                baseBarColor: Themecolors.progress??const Color.fromARGB(73, 255, 255, 255),
                progressBarColor: Themecolors.font??Colors.white,
                thumbColor: Themecolors.font??Colors.white,
                thumbRadius: thumbRadius??10,
                onSeek: (duration) {
                  PlayerFunctions.player.seek(duration);
                }
                );
          },
        ),
      ],
    );
  }
}