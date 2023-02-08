import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/app/src/model/playlist_functions.dart';
import 'package:music_app/app/src/model/playlist_model.dart';
import '../../pages/musics/musics.dart';
import '../../../../../core/theme/theme.dart';
import '../playlist.dart';
import 'add_song_builder.dart';

class AddSongFromPlayList extends StatefulWidget {
  const AddSongFromPlayList({Key? key, required this.index}) : super(key: key);
  final dynamic index;
  static List<dynamic> selectedsongs = PlayListFunctions.ids[PlayListScreen.selectedindex];
  @override
  State<AddSongFromPlayList> createState() => _AddSongFromPlayListState();
}

class _AddSongFromPlayListState extends State<AddSongFromPlayList>
    with ChangeNotifier {
  final TextEditingController _songname = TextEditingController();
  ValueNotifier<List<dynamic>> local = ValueNotifier([]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle:  SystemUiOverlayStyle(
              statusBarColor: Themecolors.background ?? const Color.fromARGB(255, 9, 19, 33),
              statusBarIconBrightness: Themecolors.enumcolor?? Brightness.light),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 10,right: 10).r,
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                            color: Themecolors.font??Colors.white,
                            fontWeight: FontWeight.w900),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.r)),
                            fillColor: Themecolors.transout??const Color.fromARGB(73, 255, 255, 255),
                            filled: true,
                            hintText: 'Search here',
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _songname.clear();
                                  local.notifyListeners();
                                },
                                icon: const Icon(
                                  Icons.clear_all,
                                  color: Colors.white,
                                ))),
                        controller: _songname,
                        onChanged: (String? songname) {
                          local.value.clear();
                          for (int i = 0; i < Musics.songslist.length; i++) {
                            if (Musics.songslist[i].title
                                .toLowerCase()
                                .contains(songname!.toLowerCase())) {
                              local.value.add(i);
                            }
                            local.notifyListeners();
                          }
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          saveplaylist(context);
                        },
                        icon: Icon(
                          Icons.save_rounded,
                          color: Themecolors.transout??const Color.fromARGB(161, 255, 255, 255),
                          size: MediaQuery.of(context).size.aspectRatio * 80,
                        )),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Expanded(
                child: Builder(
                  builder:(context) {
                  if (Musics.songslist.isEmpty) {
                  return  Center(
                    child: Text('No songs found',
                      style: TextStyle(
                        color: Themecolors.font??Colors.white,
                        fontSize:20.sp,
                        fontWeight: FontWeight.w900)),
                  );
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03),
                    child: ValueListenableBuilder(
                    valueListenable: local,
                    builder: (BuildContext context, List<dynamic> searchData,
                        Widget? child) {
                      if (_songname.text.isEmpty) {
                        local.value.clear();
                        for (var i = 0; i < Musics.songslist.length; i++) {
                          local.value.add(i);
                        }
                        local.notifyListeners();
                      }
                      if(searchData.isEmpty){
                        return  Center(
                          child: Text('Can\'t find ${_songname.text}',
                          style: TextStyle(
                          color: Themecolors.font??Colors.white,
                          fontSize:20.sp,
                          fontWeight: FontWeight.w900)),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: searchData.length,
                        itemBuilder: (BuildContext context, int index) {
                            return AddSongPlayListTile(index: searchData[index]);
                        },
                      );
                    },
                                   ),
                  );
                }, 
               )
              ),
            ],
          ),
        ));
  }

  saveplaylist(context) async {
    final model = PlaylistModel(
        name: PlayListFunctions.playlists.value[widget.index].name,
        playlists: AddSongFromPlayList.selectedsongs,
        image: PlayListFunctions.playlists.value[widget.index].image);
    await PlayListFunctions.upgradeplaylist(widget.index, model);
    Navigator.of(context).pop();
  }
}
