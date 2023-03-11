// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:on_audio_query/on_audio_query.dart';

class KSongModel {
  final SongModel song;
  final Uint8List? image;

  KSongModel({required this.song, required this.image});
}
