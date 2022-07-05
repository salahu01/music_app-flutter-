import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'playlist_model.dart';


class PlayListFunctions extends ChangeNotifier{

  static ValueNotifier<List<PlaylistModel>>playlists=ValueNotifier([]);
  static List<dynamic>ids=[];


  static addPlaylist({required  PlaylistModel model})async{
    final playlistdb=await Hive.openBox<PlaylistModel>('playlists');
    final playlisids=await Hive.openBox<dynamic>('playlistids');
    var hello=model.playlists.toList();
    await playlistdb.add(model);
    await playlisids.add(hello);
    showplaylist();
  }

  static showplaylist()async{
    final playlistdb=await Hive.openBox<PlaylistModel>('playlists');
    final playlisids=await Hive.openBox<dynamic>('playlistids');   
    playlists.value.clear();
    ids.clear();
    playlists.value.addAll(playlistdb.values);
    ids.addAll(playlisids.values.toList());
    playlists.notifyListeners();
  }
  
  static deleteplaylist(index)async{
    final playlistdb=await Hive.openBox<PlaylistModel>('playlists');
    final playlisids=await Hive.openBox<dynamic>('playlistids');   
    await playlistdb.deleteAt(index);
    await playlisids.deleteAt(index);
    showplaylist();
  }

  static upgradeplaylist(index,PlaylistModel model)async{
    final playlistdb=await Hive.openBox<PlaylistModel>('playlists');
    final playlisids=await Hive.openBox<dynamic>('playlistids');
    var hello=model.playlists.toList();
    await playlistdb.putAt(index,model);
    await playlisids.putAt(index,hello);
    showplaylist();
  }

}

