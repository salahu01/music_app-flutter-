import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../core/services/functions.dart';
import 'miniplayer/mini_player.dart';
import 'pages/details/details.dart';
import 'pages/favorites/favorites.dart';
import 'pages/musics/musics.dart';
import 'pages/playlist/playlist.dart';
import 'player/player.dart';
import 'theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static List<SongModel> songslist = [];
  static dynamic selectedid;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    OnAudioFunctons.requestPermission();
    PlayerFunctions.player.currentIndexStream.listen((index) {
      if (index != null) {
        setState(() {
          MainPage.selectedid = MainPage.songslist[PlayerFunctions.player.currentIndex!].id;
          Musics.selectedindex = index;
        });
      }
    });
  }

  int index = 1;
  PageController controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle:  SystemUiOverlayStyle(
              statusBarColor: Themecolors.background ?? const Color.fromARGB(255, 9, 19, 33),
              statusBarIconBrightness: Themecolors.enumcolor??Brightness.light),
        ),
        backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: PageView(
            controller: controller,
            onPageChanged: (page) {
              setState(() {
                index = page;
              });
            },
            children: const <Widget>[
              PlayLists(),
              Musics(),
              Favorites(),
              Details(),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              if (Musics.selectedindex != null) {
                return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerScreen(item: MainPage.songslist,index: PlayerFunctions.player.currentIndex,))),
                    child: const MiniPLayerScreen());
              }
              return const SizedBox();
            }),
            SizedBox(
              height: 70.sp,
              child: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: GNav(
                    tabBackgroundColor: Themecolors.transout??const Color.fromARGB(71, 255, 255, 255),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Themecolors.font??Colors.white,
                        fontSize: 20.sp,
                        overflow: TextOverflow.ellipsis),
                    gap: 10.sp, // the tab button gap between icon and text
                    color: Themecolors.font??Colors.white, // unselected icon color
                    activeColor: Themecolors.font??Colors.white,
                    padding: EdgeInsets.only(
                        left:10.sp,
                        right: 10.sp,
                        top: 15.sp,
                        bottom: 15.sp,
                        ),
                    tabMargin: EdgeInsets.only(
                      bottom: 10.sp,
                      left: 15.sp,
                      right: 15.sp,
                      top: 5.sp,
                    ),
                    selectedIndex: index,
                    onTabChange: (index) {
                      setState(() {
                        index = index;
                      });
                      controller.jumpToPage(index);
                    },
                    tabs: const [
                      GButton(
                        icon: Icons.playlist_add_check,
                        text: 'PlayList',
                      ),
                      GButton(
                        icon: Icons.music_note_rounded,
                        text: 'Music',
                      ),
                      GButton(
                        icon: Icons.favorite,
                        text: 'Favs',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Details',
                      )
                    ]),
              ),
            ),
          ],
        ));
  }
}