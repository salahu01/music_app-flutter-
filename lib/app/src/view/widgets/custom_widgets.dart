import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:filesize/filesize.dart';
import 'package:music_app/app/core/services/functions.dart';
import 'package:music_app/app/src/model/playlist_model.dart';
import 'package:music_app/app/src/view/screens/pages/musics/musics.dart';
import 'package:music_app/app/src/view/screens/splash_screen.dart';
import 'package:music_app/app/core/theme/theme.dart';

class CustomWidgets {
  static more(context, index, item) {
    final check = FavouritesData.favids.contains(item[index].id);
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(onPressed: () {
                if (check == false) {
                  FavouritesData.addSong(songid: item[index].id);
                  Navigator.of(context).pop();
                } else {
                  final checkindex = FavouritesData.favids.indexWhere((element) => element == item[index].id);
                  FavouritesData.deletesong(checkindex);
                  Navigator.of(context).pop();
                }
              }, child: Builder(builder: (context) {
                if (check == false) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Add to fav   '),
                      Icon(
                        Icons.favorite,
                        color: Colors.blue,
                      ),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Remove from fav   '),
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.blue,
                      )
                    ],
                  );
                }
              })),
              CupertinoActionSheetAction(
                onPressed: () {
                  details(context, index, item);
                },
                child: const Text('Details'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              )
            ],
          );
        });
  }

  static details(context, index, item) {
    final size = filesize(item[index].size);

    showModalBottomSheet(
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    MediaQuery.of(context).size.aspectRatio * 60),
                topRight: Radius.circular(
                    MediaQuery.of(context).size.aspectRatio * 60))),
        backgroundColor: const Color.fromARGB(230, 255, 255, 255),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: MediaQuery.of(context).size.aspectRatio * 80,
                        ))
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: 'Title : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: item[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Album : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: item[index].album,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Composor : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: item[index].composer,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Track : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: item[index].track.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Artist : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: item[index].artist,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Path : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: item[index].data.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Size : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: size,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Extension : ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: item[index].fileExtension,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  static sort(context) {
    return CupertinoActionSheet(
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
                  Musics.sorttype = SortFunctions.sortfunction(1);
                  Navigator.of(context).pop();
                },
                child: Builder(builder: (context) {
                  if (Musics.sorttype != SortFunctions.sortfunction(1)) {
                    return const Text('Sort by DateModified');
                  }
                  return const Text(
                    'Sort by DateModified',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w900),
                  );
                }),
              ),
              CupertinoActionSheetAction(onPressed: () {
                Musics.sorttype = SortFunctions.sortfunction(2);
                Navigator.of(context).pop();
              }, child: Builder(builder: (context) {
                if (Musics.sorttype != SortFunctions.sortfunction(2)) {
                  return const Text('Sort by Name');
                }
                return const Text(
                  'Sort by Name',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w900),
                );
              })),
              CupertinoActionSheetAction(onPressed: () {
                Musics.sorttype = SortFunctions.sortfunction(3);
                Navigator.of(context).pop();
              }, child: Builder(builder: (context) {
                if (Musics.sorttype != SortFunctions.sortfunction(3)) {
                  return const Text('Sort by Size');
                }
                return const Text(
                  'Sort by Size',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w900),
                );
              })),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              )
            ],
          );

  }

    static reset(context) {
    return CupertinoActionSheet(
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
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
                        InkWell(
                        onTap: () {
                        resetapp();
                        Themecolors.addvalue(0);
                        Themecolors.navybluetone();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                        },  
                        child: const Icon(Icons.restart_alt,color: Colors.white,))
                        ],
                        backgroundColor: const Color.fromARGB(73, 255, 255, 255),
                        title: const Text('Do you want Reset entire App?'),
                        titleTextStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                          );
                        });
                },
                child: const Text('Reset entire App'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
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
                        InkWell(
                        onTap: () {
                        resetfavourite();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                        },  
                        child: const Icon(Icons.restart_alt,color: Colors.white,))
                        ],
                        backgroundColor: const Color.fromARGB(73, 255, 255, 255),
                        title: const Text('Do you want Reset Favourite ?'),
                        titleTextStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                          );
                        });
                },
                child: const Text('Reset Favourite'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
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
                        InkWell(
                        onTap: () {
                        resetplaylist();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                        },  
                        child: const Icon(Icons.restart_alt,color: Colors.white,))
                        ],
                        backgroundColor: const Color.fromARGB(73, 255, 255, 255),
                        title: const Text('Do you want Reset PlayList?'),
                        titleTextStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                          );
                        });
                },
                child: const Text('Reset PlayList'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
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
                        InkWell(
                        onTap: () {
                        resettheme();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                        },  
                        child: const Icon(Icons.restart_alt,color: Colors.white,))
                        ],
                        backgroundColor: const Color.fromARGB(73, 255, 255, 255),
                        title: const Text('Do you want Reset Theme?'),
                        titleTextStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                          );
                        });
                },
                child: const Text('Reset Theme'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              )
            ],
          );

  }
  static resetapp()async{
      final favdb = await Hive.openBox('favBox');
      final playlistdb=await Hive.openBox<PlaylistModel>('playlists');
      final playlisids=await Hive.openBox<dynamic>('playlistids');
      await PlayerFunctions.player.stop();
      await favdb.clear();
      await playlisids.clear();
      await playlistdb.clear();
  }
  static  resetfavourite()async{
      final favdb = await Hive.openBox('favBox');
      await favdb.clear();
  }
  static  resetplaylist()async{
      final playlistdb=await Hive.openBox<PlaylistModel>('playlists');
      final playlisids=await Hive.openBox<dynamic>('playlistids');
      await playlisids.clear();
      await playlistdb.clear();
  }
  static  resettheme(){
      Themecolors.addvalue(0);
      Themecolors.navybluetone();
  }
}