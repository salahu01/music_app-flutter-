import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../pages/musics/musics.dart';
import '../../../../../core/theme/theme.dart';
import 'add_song_icons.dart';

//*playlist returntile model
class AddSongPlayListTile extends StatelessWidget {
  const AddSongPlayListTile({Key? key, required this.index}) : super(key: key);
  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
      child: ListTile(
          title: Text(
             Musics.songslist[index].title.length > 17
                  ? Musics.songslist[index].title.substring(0, 17) + '...'
                  : Musics.songslist[index].title,
              style:  TextStyle(
                  color: Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              Musics.songslist[index].artist.length > 17
                  ? Musics.songslist[index].artist.substring(0, 17) + '...'
                  : Musics.songslist[index].artist ?? 'No Artist',
              style: TextStyle(
                  color: Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
            ),
            leading: QueryArtworkWidget(
                artworkBorder: BorderRadius.circular(MediaQuery.of(context).size.width*0.03),
                id: Musics.songslist[index].id, type: ArtworkType.AUDIO),
          trailing: AddSongIcon(index: index)),
    );
  }
}