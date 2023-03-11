import 'package:flutter/material.dart';
import 'package:music_app/app/controller/main.page.controller.dart';
import 'package:provider/provider.dart';

class Musics extends StatelessWidget {
  const Musics({super.key});

  @override
  Widget build(BuildContext context) {
    // final ctrl = context.watch<MusicsController>();
    final mainPageCtrl = context.watch<MainPageController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: mainPageCtrl.songs
              .map((e) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    dense: true,
                    leading: e.image == null ? const CircleAvatar(backgroundImage: AssetImage("assets/images/IMG_0007.JPG")) : CircleAvatar(backgroundImage: MemoryImage(e.image!)),
                    title: Text(e.song.displayName, style: const TextStyle(color: Colors.white, fontSize: 12), overflow: TextOverflow.ellipsis),
                    subtitle: Text(e.song.artist ?? 'Unknown', style: const TextStyle(color: Colors.white, fontSize: 10)),
                    trailing: const Icon(Icons.more_vert, color: Colors.white),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
