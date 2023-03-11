import 'package:flutter/material.dart';
import 'package:music_app/app/configs/constants/app_states.dart';
import 'package:music_app/app/controller/musics_controller.dart';
import 'package:music_app/app/view/widgets/common.dart';
import 'package:provider/provider.dart';

class Musics extends StatelessWidget {
  const Musics({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<MusicsController>();
    return Scaffold(
      body: SateProvider.widget(
        state: ctrl.state,
        loading: loading,
        loaded: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: ColoredBox(color: Colors.white, child: SizedBox(height: 100, width: 50)),
              title: Text('Samaple', style: TextStyle(color: Colors.white)),
              subtitle: Text('Samaple', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
