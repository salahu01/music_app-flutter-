import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../functions/functions.dart';
import '../pages/musics/musics.dart';
import '../player/player.dart';
import '../theme.dart';
import 'search_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with ChangeNotifier {
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
              statusBarIconBrightness: Themecolors.enumcolor??Brightness.light),
        ),       
        resizeToAvoidBottomInset: false,
        backgroundColor: Themecolors.background??const Color.fromARGB(255, 9, 19, 33),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w900),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.aspectRatio *
                                        40)),
                            fillColor: Themecolors.transout??const Color.fromARGB(73, 255, 255, 255),
                            filled: true,
                            hintText: 'Search here',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
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
                            if (Musics.songslist[i].title.toLowerCase().contains(songname!.toLowerCase())) {
                              local.value.add(i);
                            }
                            local.notifyListeners();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                  if (Musics.songslist.isEmpty) {
                  return  Center(
                    child: Text('No songs found',
                      style: TextStyle(
                        color: Themecolors.font??Colors.white,
                        fontSize:20.sp,
                        fontWeight: FontWeight.w900)),
                  );
                  }
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ValueListenableBuilder(
                        valueListenable: local,
                        builder: (BuildContext context, List<dynamic> searchData,Widget? child) {
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
                            itemCount: searchData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () {
                                    if (searchData[index] ==PlayerFunctions.player.currentIndex) {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PlayerScreen(item: Musics.songslist,index: searchData[index],)));
                                    } else {
                                      PlayerFunctions.play(Musics.songslist, searchData[index]);
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PlayerScreen(item: Musics.songslist, index: searchData[index])));
                                    }
                                  },
                                  child: SearchTile(index: local.value[index]));
                            },
                          );
                        },
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ));
  }
}