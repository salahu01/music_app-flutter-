import 'package:flutter/material.dart';

class Musics extends StatelessWidget {
  const Musics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            leading: ColoredBox(color: Colors.white,
            child: SizedBox(
              height: 100,
              width: 50,
            ),
            ),
            title: Text('Samaple', style: TextStyle(color: Colors.white)),
            subtitle: Text('Samaple', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
