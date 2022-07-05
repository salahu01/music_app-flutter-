import 'package:hive_flutter/adapters.dart';

part 'playlist_model.g.dart';

@HiveType(typeId: 2)
class PlaylistModel {
  @HiveField(0)
  String name;
  @HiveField(5)
  List<dynamic> playlists;
  @HiveField(6)
  final String image;
  PlaylistModel({required this.name,required this.playlists,this.image=''});
}