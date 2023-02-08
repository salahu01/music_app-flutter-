// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../core/services/functions.dart';
import '../main_page.dart';
import '../player/controllers/play_pause.dart';
import '../player/controllers/progressbar.dart';
import '../theme.dart';

class MiniPLayerScreen extends StatefulWidget {
  const MiniPLayerScreen({Key? key}) : super(key: key);
  @override
  State<MiniPLayerScreen> createState() => _MiniPLayerScreenState();
}

class _MiniPLayerScreenState extends State<MiniPLayerScreen> {
  @override
  void initState() {
    super.initState();
    OnAudioFunctons.requestPermission();
    PlayerFunctions.player.currentIndexStream.listen((index) {
      if (index != null) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.05,
                child: FittedBox(
                  child: Text(
                    MainPage.songslist[PlayerFunctions.player.currentIndex!]
                                .title.length >
                            16
                        ? '${MainPage.songslist[PlayerFunctions.player.currentIndex!].title.substring(0, 16)}...'
                        : MainPage
                            .songslist[PlayerFunctions.player.currentIndex!]
                            .title,
                    style: TextStyle(
                        color: Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: FittedBox(
                  child: Text(
                      MainPage.songslist[PlayerFunctions.player.currentIndex!]
                                  .artist!.length >
                              8
                          ? '${MainPage.songslist[PlayerFunctions.player.currentIndex!].artist!.substring(0, 8)}...'
                          : MainPage
                                  .songslist[
                                      PlayerFunctions.player.currentIndex!]
                                  .artist ??
                              'No Artist',
                      style: TextStyle(
                        color: Themecolors.font??Colors.white,
                        fontWeight: FontWeight.w900,
                      )),
                ),
              )
            ],
          ),
          trailing: PlayAndPause(
            buttonsize: 40.sp,
            buttoncolor: Themecolors.font??Colors.white,
          ),
          leading: QueryArtworkWidget(
              artworkBorder: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.03),
              id: MainPage.songslist[PlayerFunctions.player.currentIndex!].id,
              type: ArtworkType.AUDIO),
        ),
        const ProgressBarscreen(thumbRadius: 0, fontsize: 0)
      ],
    );
  }
}