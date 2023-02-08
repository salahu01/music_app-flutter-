import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/app/src/model/playlist_functions.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../src/view/screens/main_page.dart';
import '../../src/view/screens/pages/musics/musics.dart';
import '../../src/view/screens/player/player.dart';

class OnAudioFunctons {
  static final OnAudioQuery audioQuery = OnAudioQuery();
  static List<String> paths = [];
  static List<String> pathsids = [];
  static requestPermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await audioQuery.permissionsRequest();
      }
    }
  }
}

class PlayerFunctions {
  static final player = AudioPlayer();
  static play(uri, index) async {
    await player.stop();
    await player.setAudioSource(playAll(uri), initialIndex: index);
    await player.play();
  }

  static Stream<DurationState> get durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          player.positionStream,
          player.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));

  static ConcatenatingAudioSource playAll(List<SongModel>? data) {
    MainPage.songslist.clear();
    List<AudioSource> sources = [];
    for (var i = 0; i < data!.length; i++) {
      sources.add(AudioSource.uri(
        Uri.parse(data[i].uri!),
        tag: MediaItem(
          id: data[i].id.toString(),
          title: data[i].title,
          artUri:Uri.parse('https://i.pinimg.com/564x/5b/04/13/5b0413927e5a033e6ed47000f75a376e.jpg')
        ),
      ));
      MainPage.songslist.add(data[i]);
    }
    PlayerScreen.songslist.addAll(MainPage.songslist);
    return ConcatenatingAudioSource(children: sources);
  }
}

class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});
  Duration position, total;
}

class FavouritesData extends ChangeNotifier {
  static ValueNotifier<List> favsongs = ValueNotifier([]);
  static List<SongModel> favmodel = [];
  static dynamic favids;
  static showsongs() async {
    final favdb = await Hive.openBox('favBox');
    final dynamic localsongs = favdb.values.toList();
    favids = favdb.values.toList();
    favsongs.value.clear();
    favmodel.clear();
    for (int i = 0; i < localsongs.length; i++) {
      for (int j = 0; j < Musics.songslist.length; j++) {
        if (Musics.songslist[j].id == localsongs[i]) {
          favsongs.value.add(j);
          break;
        }
        if (j == Musics.songslist.length - 1) {
          await favdb.deleteAt(i);
        }
      }
    }
    for (var i = 0; i < favsongs.value.length; i++) {
      favmodel.add(Musics.songslist[favsongs.value[i]]);
    }

    favsongs.notifyListeners();
  }

  static addSong({required songid}) async {
    final favdb = await Hive.openBox('favBox');
    await favdb.add(songid);
    await showsongs();
  }

  static deletesong(index) async {
    final favdb = await Hive.openBox('favBox');
    await favdb.deleteAt(index);
    await showsongs();
  }
}

class SortFunctions {
  static SongSortType? sortfunction(value) {
    SongSortType? sort;
    switch (value) {
      case 1:
        sort = SongSortType.DATE_ADDED;
        break;
      case 2:
        sort = SongSortType.TITLE;
        break;
      case 3:
        sort = SongSortType.SIZE;
        break;
      default:
        sort = null;
    }
    return sort;
  }
}

class PlayListScreenFunctions {
  static ValueNotifier<List<int>> playlistsongs = ValueNotifier([]);
  static List<SongModel> playlistsongsmodel = [];
  static showplaylistsongs(index) {
    final localsongs = PlayListFunctions.ids[index];
    playlistsongs.value.clear();
    playlistsongsmodel.clear();
    for (int i = 0; i < localsongs.length; i++) {
      for (int j = 0; j < Musics.songslist.length; j++) {
        if (Musics.songslist[j].id == localsongs[i]) {
          playlistsongs.value.add(j);
          playlistsongsmodel.add(Musics.songslist[j]);
          break;
        }
      }
    }
  }
}