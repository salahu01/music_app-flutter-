import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/app/src/model/playlist_functions.dart';
import '../../../theme.dart';
import 'add_or_remove.dart';

class AddToPlayList extends StatefulWidget {
  const AddToPlayList({Key? key}) : super(key: key);

  @override
  State<AddToPlayList> createState() => _AddToPlayListState();
}

class _AddToPlayListState extends State<AddToPlayList> {
  @override
  Widget build(BuildContext context) {
    PlayListFunctions.showplaylist();
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            enableDrag: true,
            shape: RoundedRectangleBorder( 
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.aspectRatio * 60),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.aspectRatio * 60))),
            backgroundColor: const Color.fromARGB(149, 255, 255, 255),
            context: context,
            builder: (BuildContext context) {
              if (PlayListFunctions.playlists.value.isEmpty) {
                return Center(
                    child: Text('Create PlayList',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:MediaQuery.of(context).size.aspectRatio * 50,
                            fontWeight: FontWeight.w900)));
              }
              return Column(
                children: [
                  SizedBox(height: 30.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: PlayListFunctions.playlists.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                            child: ColoredBox(
                              color: const Color.fromARGB(184, 0, 0, 0),
                              child: SizedBox(
                                height: 70.h,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ListTile(
                                      title: Text(PlayListFunctions.playlists.value[index].name,
                                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w900),
                                      ),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.r),
                                        child: Builder(builder: (context) {
                                          if (PlayListFunctions.playlists.value[index].image !='') {
                                            return Image.memory(const Base64Decoder().convert(PlayListFunctions.playlists.value[index].image.toString()));
                                          }else{
                                          return Image.asset('lib/assets/images/IMG_0007.JPG',
                                            fit: BoxFit.cover,
                                          );
                                          }
                                        }),
                                      ),
                                      trailing:PlayerPlayListAddRemoveButton(index: index)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(Icons.playlist_add,color: Themecolors.font ?? Colors.white, size: 25.sp));
  }
}