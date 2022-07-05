import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../functions/functions.dart';
import '../../model/playlist_functions.dart';
import '../main_page.dart';
import '../miniplayer/mini_player.dart';
import '../pages/musics/musics.dart';
import '../player/player.dart';
import '../theme.dart';
import 'addsongs/add_songs.dart';
import 'playlist_builder.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen(
      {Key? key, required this.playlistname, required this.index})
      : super(key: key);
  final String playlistname;
  final dynamic index;
  static dynamic selectedindex;

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  void initState() {
    super.initState();
    PlayerFunctions.player.currentIndexStream.listen((index) {
      if (index != null) {
        setState(() {
          MainPage.selectedid = MainPage.songslist[PlayerFunctions.player.currentIndex!].id;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final check = PlayListFunctions.ids[widget.index].contains(MainPage.selectedid);
    PlayListScreenFunctions.showplaylistsongs(widget.index);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle:  SystemUiOverlayStyle(
              statusBarColor: Themecolors.background ?? const Color.fromARGB(255, 9, 19, 33),
              statusBarIconBrightness: Themecolors.enumcolor ?? Brightness.light),
        ),
        backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Themecolors.font??Colors.white,
                          size: MediaQuery.of(context).size.width * 0.08,
                        )),
                    //*playlist title
                    Text(
                      widget.playlistname.length<10 ? widget.playlistname:'${widget.playlistname.substring(0, 10)}...',
                      style: TextStyle(
                          color: Themecolors.font??Colors.white,
                          fontSize:30.sp,
                          fontWeight: FontWeight.w900),
                    ),
                    InkWell(
                        onTap: () {
                          PlayListScreen.selectedindex = widget.index;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddSongFromPlayList( index: widget.index,)))
                              .whenComplete(() {
                            setState(() {});
                          });
                        },
                        child: Icon(
                          Icons.playlist_add,
                          color: Themecolors.font??Colors.white,
                          size: MediaQuery.of(context).size.width * 0.08,
                        )),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                  child: ValueListenableBuilder(
                    valueListenable: PlayListScreenFunctions.playlistsongs,
                    builder: (BuildContext context, List<dynamic> playlistsongs,
                        Widget? child) {
                      if (playlistsongs.isEmpty) {
                        return Center(
                            child: Text('Add Songs',
                                style: TextStyle(
                                    color: Themecolors.font??Colors.white,
                                    fontSize:20.sp,
                                    fontWeight: FontWeight.w900)));
                      }
                      return ListView.builder(
                        itemCount: playlistsongs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                if (Musics.songslist[playlistsongs[index]].id ==
                                    MainPage.selectedid) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayerScreen(
                                          item: MainPage.songslist,
                                          index: PlayerFunctions
                                              .player.currentIndex)));
                                } else {
                                  PlayerFunctions.play(
                                      PlayListScreenFunctions.playlistsongsmodel,
                                      index);
                                  setState(() {});
                                }
                              },
                              child: PlayListSongTile(
                                index: playlistsongs[index],
                                item: PlayListScreenFunctions.playlistsongsmodel,
                              ));
                        },
                      );
                    },
                  ),
                ),
              ),
              Builder(builder: (context) {
                if (check == true) {
                  return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlayerScreen(
                                item: MainPage.songslist,
                                index: PlayerFunctions.player.currentIndex,
                              ))),
                      child:  ColoredBox(
                          color: Themecolors.transin??const Color.fromARGB(104, 255, 255, 255),
                          child: const MiniPLayerScreen()));
                }
                return const SizedBox();
              })
            ],
          ),
        ));
  }
}
