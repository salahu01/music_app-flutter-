import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../core/services/functions.dart';
import '../main_page.dart';
import '../../../../core/theme/theme.dart';
import '../musics/musics.dart';

class FavouriteListBuilder extends StatelessWidget {
  const FavouriteListBuilder({Key? key, required this.index}) : super(key: key);
  final dynamic index;
  @override
  Widget build(BuildContext context) {
    if (FavouritesData.favmodel[index].id == MainPage.selectedid) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.aspectRatio * 30),
          child: ColoredBox(
            color: Themecolors.transin??const Color.fromARGB(104, 255, 255, 255),
            child: ListTile(
                title: Text(
                  Musics.songslist[FavouritesData.favsongs.value[index]].title
                              .length >
                          17
                      ? Musics.songslist[FavouritesData.favsongs.value[index]]
                              .title
                              .substring(0, 17) +
                          '...'
                      : Musics.songslist[FavouritesData.favsongs.value[index]]
                          .title,
                  style:  TextStyle(
                      color: Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  Musics.songslist[FavouritesData.favsongs.value[index]].artist
                              .length >
                          17
                      ? Musics.songslist[FavouritesData.favsongs.value[index]]
                              .artist
                              .substring(0, 17) +
                          '...'
                      : Musics.songslist[FavouritesData.favsongs.value[index]]
                              .artist ??
                          'No Artist',
                  style:  TextStyle(
                      color:Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
                ),
                leading: QueryArtworkWidget(
                    artworkBorder: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.03),
                    id: Musics
                        .songslist[FavouritesData.favsongs.value[index]].id,
                    type: ArtworkType.AUDIO),
                trailing: InkWell(
                  onTap: () {
                    FavouritesData.deletesong(index);
                  },
                  child:  Icon(
                    Icons.delete,
                    color: Themecolors.font??Colors.white,
                    size: 25.sp,
                  ),
                )),
          ),
        ),
      );
    } else {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        child: ListTile(
            title: Text(
              Musics.songslist[FavouritesData.favsongs.value[index]].title
                          .length >
                      17
                  ? Musics.songslist[FavouritesData.favsongs.value[index]].title
                          .substring(0, 17) +
                      '...'
                  : Musics
                      .songslist[FavouritesData.favsongs.value[index]].title,
              style: TextStyle(
                  color: Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              Musics.songslist[FavouritesData.favsongs.value[index]].artist
                          .length >
                      17
                  ? Musics.songslist[FavouritesData.favsongs.value[index]]
                          .artist
                          .substring(0, 17) +
                      '...'
                  : Musics.songslist[FavouritesData.favsongs.value[index]]
                          .artist ??
                      'No Artist',
              style:  TextStyle(
                  color: Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
            ),
            leading: QueryArtworkWidget(
                artworkBorder: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
                id: Musics.songslist[FavouritesData.favsongs.value[index]].id,
                type: ArtworkType.AUDIO),
            trailing: InkWell(
              onTap: () {
                FavouritesData.deletesong(index);
              },
              child:  Icon(
                Icons.delete,
                color: Themecolors.font??Colors.white,
                size: 25.sp,
              ),
            )),
      );
    }
  }
}