import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';

import '../../../functions/functions.dart';
import '../../theme.dart';

class LoopButton extends StatelessWidget {
  const LoopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
                PlayerFunctions.player.loopMode== LoopMode.one? PlayerFunctions.player.setLoopMode(LoopMode.all):PlayerFunctions.player.setLoopMode(LoopMode.one);
              }, icon: StreamBuilder<LoopMode>(
                stream: PlayerFunctions.player.loopModeStream,
                builder: (context,snapshot) {
                final loopMode=snapshot.data;
                  if(LoopMode.one== loopMode){
                    return Icon(
                      Icons.repeat_one_outlined,
                      color: Themecolors.font??Colors.white,
                      size: 25.sp,
                      );
                  }
                    return Icon(
                      Icons.repeat,
                      color: Themecolors.font??Colors.white,
                      size: 25.sp,
                      );
                },
              ),
              );
  }
}