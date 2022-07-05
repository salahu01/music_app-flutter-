import 'package:flutter/material.dart';

import '../../../../model/playlist_functions.dart';
import '../../../../model/playlist_model.dart';
import '../../../main_page.dart';


//*return tile add and remove button model
class PlayerPlayListAddRemoveButton extends StatefulWidget {
  const PlayerPlayListAddRemoveButton({Key? key,required this.index}) : super(key: key);
  final dynamic index;
  
  @override
  State<PlayerPlayListAddRemoveButton> createState() => _PlayerPlayListAddRemoveButtonState();
}

class _PlayerPlayListAddRemoveButtonState extends State<PlayerPlayListAddRemoveButton> {
  @override
  Widget build(BuildContext context) {
  List<dynamic>selectedsongs=PlayListFunctions.ids[widget.index];   
  final checkindex=selectedsongs.indexWhere((element) => element==MainPage.selectedid);
  final check=selectedsongs.contains(MainPage.selectedid);
  if(check==true){
    return IconButton(onPressed: ()async{
    await selectedsongs.removeAt(checkindex);
    final model= PlaylistModel(name: PlayListFunctions.playlists.value[widget.index].name, playlists:selectedsongs ,image: PlayListFunctions.playlists.value[widget.index].image);
    await PlayListFunctions.upgradeplaylist(widget.index,model);
    setState(() {});
    }, icon: const Icon(Icons.remove_circle,color: Colors.white,));
  }
  return IconButton(onPressed: ()async{
    selectedsongs.add(MainPage.selectedid);
    final model= PlaylistModel(name: PlayListFunctions.playlists.value[widget.index].name, playlists:selectedsongs ,image: PlayListFunctions.playlists.value[widget.index].image);
    await PlayListFunctions.upgradeplaylist(widget.index,model);
    setState(() {});
  }, icon: const Icon(Icons.add_circle,color: Colors.white,));
  }
}