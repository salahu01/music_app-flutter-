// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../widgets/custom_widgets.dart';
import '../main_page.dart';
import '../../screens/theme.dart';

class MusicListBuilder extends StatelessWidget {
  const MusicListBuilder({Key? key, required this.index, required this.item})
      : super(key: key);
  final dynamic index;
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    if (item.data[index].id == MainPage.selectedid) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.aspectRatio*30),
          child: ColoredBox(
            color: Themecolors.transin??const Color.fromARGB(104, 255, 255, 255),
            child: ListTile(
                title: Text(
                  item.data![index].title.length > 17
                      ? item.data![index].title.substring(0, 17) + '...'
                      : item.data![index].title,
                  style: TextStyle(
                      color: Themecolors.font??Colors.white, 
                      fontWeight: FontWeight.w900
                      ),
                ),
                subtitle: Text(
                  item.data![index].artist.length > 17
                      ? item.data![index].artist.substring(0, 17) + '...'
                      : item.data[index].artist ?? 'No Artist',
                  style: TextStyle(
                      color: Themecolors.font??Colors.white, fontWeight: FontWeight.w900),
                ),
                leading: QueryArtworkWidget(
                    artworkBorder: BorderRadius.circular(MediaQuery.of(context).size.width*0.03),
                    id: item.data![index].id, type: ArtworkType.AUDIO),
                trailing: InkWell(
                  onTap: (){
                  CustomWidgets.more(context,index,item.data);
                  },
                  child: Icon(
                Icons.more_vert,
                color: Themecolors.font??Colors.white,
                size: 40.sp
              ),
                ),
            ),
          ),
        ),
      );
    }else{
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
        child: ListTile(
            title: Text(
              item.data![index].title.length > 17
                  ? item.data![index].title.substring(0, 17) + '...'
                  : item.data![index].title,
              style: TextStyle(
                  color: Themecolors.font??Colors.white, 
                  fontWeight: FontWeight.w900,
                  ),
            ),
            subtitle: Text(
              item.data![index].artist.length > 17
                  ? item.data![index].artist.substring(0, 17) + '...'
                  : item.data[index].artist ?? 'No Artist',
              style: TextStyle(
                  color: Themecolors.font??Colors.white, 
                  fontWeight: FontWeight.w900,
                  ),
            ),
            leading: QueryArtworkWidget(
              artworkBorder: BorderRadius.circular(MediaQuery.of(context).size.width*0.03),
              id: item.data![index].id, type: ArtworkType.AUDIO),
            trailing: InkWell(
              onTap: () {
                 CustomWidgets.more(context,index,item.data);
              },
              child:  Icon(
                Icons.more_vert,
                color: Themecolors.font??Colors.white,
                size: 40.sp
              ),
            )),
      ),
    );
    }
  }

}
