import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/functions.dart';
import '../main_page.dart';
import '../../screens/player/player.dart';
import '../../screens/search/search.dart';
import '../../screens/theme.dart';
import '../musics/musics.dart';
import 'list_builder_favourite.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);
  static dynamic favouriteSongslist;

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
    FavouritesData.showsongs();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const SearchScreen())));
                  },
                  icon: Icon(
                    Icons.search_outlined,
                    color: Themecolors.font??Colors.white,
                    size: 30.sp,
                  )),
              Text(
                'Favourites',
                style: TextStyle(
                    color: Themecolors.font??Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900),
              ),
              InkWell(
                  onTap: () {
                    if(FavouritesData.favmodel.isEmpty){
                              showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return  AlertDialog(
                                  actions: [
                                  InkWell(
                                  onTap: (){
                                  Navigator.of(context).pop();
                                  },  
                                  child: const Icon(Icons.cancel,color: Colors.white,)),
                                  ],
                                  backgroundColor: const Color.fromARGB(73, 255, 255, 255),
                                  title: const Text('Please add favourite'),
                                  titleTextStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                                );
                              });
                    }else{
                    FavouritesData.showsongs();
                    PlayerFunctions.play(FavouritesData.favmodel, 0);
                    setState(() {});
                    }
                  },
                  child: Icon(
                    Icons.playlist_play,
                    color: Themecolors.font??Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  )),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
              child: ValueListenableBuilder(
                valueListenable: FavouritesData.favsongs,
                builder: (BuildContext context, List<dynamic> allsongs,Widget? child) {
                  Favorites.favouriteSongslist = allsongs;
                  if(Musics.songslist.isEmpty){
                  return Center(
                    child: Text('No musics found',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:23.sp,
                            fontWeight: FontWeight.w900)));
                  }
                  else if (allsongs.isEmpty) {
                    return Center(
                      child: Text('Add favourites',
                          style: TextStyle(
                              color: Themecolors.font??Colors.white,
                              fontSize:25.sp,
                              fontWeight: FontWeight.w900)),
                    );
                  }
                  return ListView.builder(
                    itemCount: allsongs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            if (Musics.songslist[allsongs[index]].id ==MainPage.selectedid) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerScreen( item: MainPage.songslist,index:PlayerFunctions.player.currentIndex)));
                            } else {
                              PlayerFunctions.play(FavouritesData.favmodel, index);
                              setState(() {});
                            }
                          },
                          child: FavouriteListBuilder(index: index));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}