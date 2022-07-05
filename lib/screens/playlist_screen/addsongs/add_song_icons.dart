import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pages/musics/musics.dart';
import '../../theme.dart';
import 'add_songs.dart';

//*return tile add and remove button model
class AddSongIcon extends StatefulWidget {
  const AddSongIcon({Key? key,required this.index}) : super(key: key);
  final dynamic index;
  
  @override
  State<AddSongIcon> createState() => _AddSongIconState();
}

class _AddSongIconState extends State<AddSongIcon> {
  @override
  Widget build(BuildContext context) {
  final check=AddSongFromPlayList.selectedsongs.contains(Musics.songslist[widget.index].id);
  if(check==true){
    return IconButton(onPressed: ()async{
    final checkindex=AddSongFromPlayList.selectedsongs.indexWhere((element) => element==Musics.songslist[widget.index].id);
    await AddSongFromPlayList.selectedsongs.removeAt(checkindex);
    setState(() {});
    }, icon: Icon(Icons.remove_circle,color: Themecolors.font??Colors.white,size: 25.sp));
  }
  return IconButton(onPressed: ()async{
    AddSongFromPlayList.selectedsongs.add(Musics.songslist[widget.index].id);
    setState(() {});
  }, icon:  Icon(Icons.add_circle,color: Themecolors.font??Colors.white,size: 25.sp));
  }
}