// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_widgets.dart';
import '../../../../core/services/functions.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../main_page.dart';
import '../pages/musics/musics.dart';
import '../theme.dart';
import 'controllers/addtoplaylist/addtoplaylist.dart';
import 'controllers/favourite.dart';
import 'controllers/loop_modes.dart';
import 'controllers/play_pause.dart';
import 'controllers/progressbar.dart';
import 'controllers/shuffle.dart';
// import 'controllers/shuffle.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key? key, required this.item, required this.index})
      : super(key: key);
  dynamic item;
  dynamic index;
  dynamic zero = 0;
  static List<SongModel> songslist = [];
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    PlayerFunctions.player.currentIndexStream.listen((index) {
      if (index != null) {
        widget.index = PlayerFunctions.player.currentIndex;
        setState(() {
          MainPage.selectedid = MainPage.songslist[PlayerFunctions.player.currentIndex!].id;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    FavouritesData.showsongs();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Themecolors.font??Colors.white,
                        size: 25.sp,
                        ),
                  ),
                  InkWell(
                    onTap: () => CustomWidgets.details(
                        context, widget.index, widget.item),
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: Themecolors.font??Colors.white,
                      size: 25.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.center,
                  child: QueryArtworkWidget(
                    artworkQuality: FilterQuality.high,
                    quality: 100,
                    artworkHeight: 280.h,
                    artworkWidth: 280.h,
                    id: widget.item[widget.index].id,
                    type: ArtworkType.AUDIO,
                  )),
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.item[widget.index].title.length > 17
                          ? widget.item[widget.index].title.substring(0, 17) +
                              '...'
                          : widget.item[widget.index].title,
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Themecolors.font??Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.item[widget.index].artist.length > 12
                          ? widget.item[widget.index].artist.substring(0, 12) +
                              '...'
                          : widget.item[widget.index].artist ?? 'No Artist',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Themecolors.font??Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //*loopmode button
                const LoopButton(),
                //*favourite button
                FavButton(index: PlayerFunctions.player.currentIndex),
                //*playlist
                const AddToPlayList(),
                //*shuffle button
                const Shuffle(),
              ],
            ),
            //*progress bar
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const ProgressBarscreen()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //*previous button
                InkWell(
                    onTap: () {
                      if (PlayerFunctions.player.currentIndex == 0) {
                        PlayerFunctions.play(PlayerScreen.songslist, PlayerScreen.songslist.length-1);
                      } else {
                        Musics.selectedindex = Musics.selectedindex - 1;
                        PlayerFunctions.player.seekToPrevious();
                      }
                    },
                    child: Icon(Icons.skip_previous,
                        color: Themecolors.font??Colors.white,
                        size: 40.sp
                        )),
                //*play and pause
                PlayAndPause(
                    buttonsize: 80.sp,
                    buttoncolor: Themecolors.font??Colors.white,
                    ),
                //*next button
                InkWell(
                    onTap: () {
                      if (PlayerFunctions.player.currentIndex == MainPage.songslist.length-1) {
                        Musics.selectedindex = widget.zero;
                        PlayerFunctions.play(PlayerScreen.songslist, 0);
                      } else {
                        Musics.selectedindex = Musics.selectedindex + 1;
                        PlayerFunctions.player.seekToNext();
                      }
                    },
                    child: Icon(Icons.skip_next,
                        color:Themecolors.font??Colors.white,
                        size: 40.sp,
                        )),
              ],
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}