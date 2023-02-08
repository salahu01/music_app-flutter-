import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screens/theme.dart';

//*returning model tile
class GridBuilder extends StatefulWidget {
  const GridBuilder({Key? key ,required this.index,required this.image}) : super(key: key);
  final dynamic index;
  final dynamic image;

  @override
  State<GridBuilder> createState() => _GridBuilderState();
}

class _GridBuilderState extends State<GridBuilder> {
  @override
  Widget build(BuildContext context) {
    if(widget.image!=''){
      return Column(
        children: [
          Expanded(
            child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(const Base64Decoder().convert(widget.image.toString()))),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(17.r)),
                 
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return  AlertDialog(
                                  actions: [
                                  InkWell(
                                  onTap: (){
                                  Navigator.of(context).pop();
                                  },  
                                  child: const Icon(Icons.cancel,color: Colors.white,)),
                                  InkWell(
                                  onTap: () {
                                  // PlayListFunctions.deleteplaylist(widget.index);
                                  Navigator.of(context).pop();
                                  },  
                                  child: const Icon(Icons.delete,color: Colors.white,))
                                  ],
                                  backgroundColor: const Color.fromARGB(73, 255, 255, 255),
                                  title: const Text('Do you want delete ?'),
                                  titleTextStyle: const TextStyle(
                                      fontWeight: FontWeight.w900, color: Colors.white),
                                );
                              });
                        },
                      child: const Icon(Icons.delete,color: Color.fromARGB(255, 255, 255, 255),)),
                  SizedBox(width: MediaQuery.of(context).size.width*0.02)
                  ]),
              ],
            ),
              ),
          ),
         Text('vhvhvvhjvhjvhjvhjvhjvh',
         style:  TextStyle(fontWeight: FontWeight.w900,color: Themecolors.font??Colors.white))
        ],
      );
    }
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('lib/assets/images/IMG_0007.JPG'),
                  fit: BoxFit.cover
                    ),
                borderRadius: BorderRadius.circular(
                    17.r)),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex:5),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return  AlertDialog(
                                  actions: [
                                  InkWell(
                                  onTap: (){
                                  Navigator.of(context).pop();
                                  },  
                                  child: const Icon(Icons.cancel,color: Colors.white,)),
                                  InkWell(
                                  onTap: () {
                                  // PlayListFunctions.deleteplaylist(widget.index);
                                  Navigator.of(context).pop();
                                  },  
                                  child: const Icon(Icons.delete,color: Colors.white,))
                                  ],
                                  backgroundColor: const Color.fromARGB(73, 255, 255, 255),
                                  title: const Text('Do you want delete ?'),
                                  titleTextStyle: const TextStyle(
                                      fontWeight: FontWeight.w900, color: Colors.white),
                                );
                              });
                        },
                      child: const Icon(Icons.delete,color: Color.fromARGB(255, 255, 255, 255),)),
                  SizedBox(width: MediaQuery.of(context).size.width*0.02)
                  ],
                ),                
              ],
            ),
          ),
        ),
         Text('PlayListFunctions.playlists.value[widget.index].name',
         overflow: TextOverflow.ellipsis,
         maxLines: 1,
         style: TextStyle(fontWeight: FontWeight.w900,color: Themecolors.font??Colors.white))
      ],
    );
  }
}
