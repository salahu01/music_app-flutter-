import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_app/app/configs/constants/app_states.dart';
import 'package:music_app/app/models/song.model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MainPageController extends SateProvider {
  MainPageController() {
    getSongs();
  }
  // geters
  int get index => _index;
  String get title => _title;
  PageController get pageConteroller => _pageController;
  KState get state => _state;

  // values
  final _pageController = PageController(initialPage: 1);
  int _index = 1;
  String _title = 'Musics';
  final _titles = ['PlayLists', 'Musics', 'Favourite', 'Settings'];
  KState _state = KState.loading;
  List<KSongModel> songs = [];
  final _audioQuery = OnAudioQuery();

  // seters
  void changeIndex(int index) {
    _pageController.jumpToPage(index);
    updateTitle(index);
  }

  void changePage(int index) {
    _index = index;
    updateTitle(index);
  }

  void updateTitle(int index) {
    _title = _titles[index];
    notifyListeners();
  }

  void getSongs() async {
    !await _audioQuery.permissionsStatus() ? await _audioQuery.permissionsRequest() : null;
    final querySongs = await _audioQuery.querySongs();
    for (var e in querySongs) {
      final image = await _audioQuery.queryArtwork(e.id, ArtworkType.AUDIO);
    
      songs.add(KSongModel(song: e, image: image));
    }
    update(() => _state = KState.loaded);
  }
}
