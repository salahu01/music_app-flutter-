import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screens/playlist_screen/playlist.dart';
import '../../screens/search/search.dart';
import '../../../../core/theme/theme.dart';
import 'addplaylist/add_details.dart';
import 'grid_builder.dart';


class PlayLists extends StatefulWidget {
  const PlayLists({Key? key}) : super(key: key);
  @override
  State<PlayLists> createState() => _PlayListsState();
}

class _PlayListsState extends State<PlayLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const SearchScreen())));
                  },
                  icon: Icon(
                    Icons.search_outlined,
                    color: Themecolors.font??Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  )),
              Text(
                'PlayList',
                style: TextStyle(
                    color: Themecolors.font??Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900),
              ),
              IconButton(
                  onPressed: () {
                       showModalBottomSheet(
                       enableDrag: true,
                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(
                       topLeft:Radius.circular(MediaQuery.of(context).size.aspectRatio*60),
                       topRight:Radius.circular(MediaQuery.of(context).size.aspectRatio*60))),
                       backgroundColor: const Color.fromARGB(149, 255, 255, 255),
                       context: context,
                       builder: (BuildContext context){
                        return const BottomSheetContents();
                         },
                     );
                  },
                  icon: Icon(
                    Icons.playlist_add,
                    color: Themecolors.font??Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  )),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Expanded(
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(17.r),
          //     child: SizedBox(
          //       width: MediaQuery.of(context).size.width*0.9,
          //       child: ValueListenableBuilder(
          //         valueListenable: ,
          //         builder: (BuildContext context, dynamic value, Widget? child) {
          //       //    if (PlayListFunctions.playlists.value.isEmpty) {
          //       //   return  Center(child: Text('Add PLayList',style: TextStyle(
          //       //     color: Themecolors.font??Colors.white,
          //       //     fontSize: 25.sp,
          //       //     fontWeight: FontWeight.w900)));
          //       // }
          //         return  GridView.builder(
          //         shrinkWrap: true,
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 3,
          //             crossAxisSpacing: 10,
          //             childAspectRatio:MediaQuery.of(context).size.aspectRatio * 1.4,
          //             mainAxisSpacing: 10),
          //         itemCount: PlayListFunctions.playlists.value.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return InkWell(
          //             onTap: () {
          //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayListScreen(playlistname: PlayListFunctions.playlists.value[index].name, index: index)));
          //             },
          //             child: GridBuilder(index:index,image: PlayListFunctions.playlists.value[index].image,)
          //           );
          //         },
          //       );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}