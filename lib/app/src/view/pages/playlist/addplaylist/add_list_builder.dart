import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../musics/musics.dart';
import 'add_remove_icon.dart';

//*playlist returntile model
class AddPlayListTile extends StatelessWidget {
  const AddPlayListTile({Key? key,required this.index}) : super(key: key);
  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width*0.02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
              child: ColoredBox(
                color: const Color.fromARGB(184, 0, 0, 0),
                child: ListTile(
                      title: Text(
                Musics.songslist[index].title.length > 17
                    ? Musics.songslist[index].title.substring(0, 17) + '...'
                    : Musics.songslist[index].title,
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                Musics.songslist[index].artist.length > 17
                    ? Musics.songslist[index].artist.substring(0, 17) + '...'
                    : Musics.songslist[index].artist ?? 'No Artist',
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                      leading: QueryArtworkWidget(
                  id: Musics.songslist[index].id, type: ArtworkType.AUDIO),
                      trailing: PlayListAddRemoveButton(index: index)
                      ),
              ),
            ),
          );
  }
}