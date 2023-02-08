import 'package:flutter/material.dart';

import '../../musics/musics.dart';
import 'add_details.dart';

//*return tile add and remove button model
class PlayListAddRemoveButton extends StatefulWidget {
  const PlayListAddRemoveButton({Key? key,required this.index}) : super(key: key);
  final dynamic index;
  
  @override
  State<PlayListAddRemoveButton> createState() => _PlayListAddRemoveButtonState();
}

class _PlayListAddRemoveButtonState extends State<PlayListAddRemoveButton> {
  @override
  Widget build(BuildContext context) {
  final checkindex=BottomSheetContents.selectedsongs.indexWhere((element) => element==Musics.songslist[widget.index].id);
  final check=BottomSheetContents.selectedsongs.contains(Musics.songslist[widget.index].id);
  if(check==true){
    return IconButton(onPressed: ()async{
    await BottomSheetContents.selectedsongs.removeAt(checkindex);
    setState(() {});
    }, icon: const Icon(Icons.remove_circle,color: Colors.white,));
  }
  return IconButton(onPressed: ()async{
    BottomSheetContents.selectedsongs.add(Musics.songslist[widget.index].id);
    setState(() {});
  }, icon: const Icon(Icons.add_circle,color: Colors.white,));
  }
}