import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../functions/functions.dart';
import '../../main_page.dart';
import '../../theme.dart';

class FavButton extends StatefulWidget {
  const FavButton({Key? key, required this.index}) : super(key: key);
  final dynamic index;
  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    final checkindex = FavouritesData.favids.indexWhere((element) => element == MainPage.songslist[widget.index].id);
    final check = FavouritesData.favids.contains(MainPage.songslist[widget.index].id);
    if (check == true) {
      return IconButton(
          onPressed: () async {
            await FavouritesData.deletesong(checkindex);
            setState(() {});
          },
          icon: Icon(
            Icons.favorite,
            color: Themecolors.font??Colors.white,
            size: 25.sp,
          ));
    }
    return IconButton(
        onPressed: () async {
          await FavouritesData.addSong(songid: MainPage.songslist[widget.index].id);
          setState(() {});
        },
        icon: Icon(
          Icons.favorite_outline_outlined,
          color: Themecolors.font??Colors.white,
          size: 25.sp,
        ));
  }
}
