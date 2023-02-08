import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../src/view/screens/splash_screen.dart';

class Themecolors {
  static bool? returnvalue;
  static Color? font;
  static Color? background;
  static Color? transout;
  static Color? transin;
  static Color? themechoose;
  static Color? progress;
  static Brightness? enumcolor;

  static greytone(){
  enumcolor=Brightness.dark;
  font=Colors.black;
  background=Colors.grey;
  transin=const Color.fromARGB(149, 255, 255, 255);
  transout=const Color.fromARGB(148, 0, 0, 0);
  progress=const Color.fromARGB(98, 0, 0, 0);
  }
  static navybluetone(){
  enumcolor=Brightness.light;
  font=null;
  background=null;
  transin=null;
  transout=null;
  progress=null;
  }
  static blacktone(){
  enumcolor=Brightness.light;
  font=null;
  background=Colors.black;
  transin=null;
  transout=null;
  progress=null;
  }
  static whitetone(){
  enumcolor=Brightness.dark;
  font=Colors.black;
  background=Colors.white;
  transout=const Color.fromARGB(148, 0, 0, 0);
  transin=const Color.fromARGB(148, 0, 0, 0);
  progress=const Color.fromARGB(148, 0, 0, 0);
  }
  static pinktone(){
  enumcolor=Brightness.light;
  font=Colors.black;
  background=Colors.pink[200];
  transin=const Color.fromARGB(149, 255, 255, 255);
  transout=const Color.fromARGB(148, 0, 0, 0);
  progress=const Color.fromARGB(97, 255, 255, 255);
  }
  static greentone(){
  enumcolor=Brightness.light;
  font=Colors.black;
  background=Colors.green[600];
  transin=const Color.fromARGB(149, 255, 255, 255);
  transout=const Color.fromARGB(148, 0, 0, 0);
  progress=const Color.fromARGB(97, 255, 255, 255);
  }

  static themeselection(context){
        showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
                  addvalue(1);
                  Themecolors.settheme();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                child:const Text('Grey Tone')
              ),
                CupertinoActionSheetAction(
                  onPressed: () {
                  addvalue(2);
                  Themecolors.settheme();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                child:const Text('White Tone')
              ),
                CupertinoActionSheetAction(
                  onPressed: () {
                  addvalue(3);
                  Themecolors.settheme();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                child:const Text('Black Tone')
              ),
              CupertinoActionSheetAction(
                  onPressed: () {
                  addvalue(0);
                  Themecolors.settheme();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                child: const Text('NavyBlue Tone')
              ),
              CupertinoActionSheetAction(
                  onPressed: () {
                  addvalue(4);
                  Themecolors.settheme();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                child: const Text('Pink Tone')
              ),
              CupertinoActionSheetAction(
                  onPressed: () {
                  addvalue(5);
                  Themecolors.settheme();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
                },
                child: const Text('Green Tone')
              ),
              CupertinoActionSheetAction(
                  onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close')
              ),
            ],
          );
        });
  }
  
  static settheme()async{
    final themeprefs = await SharedPreferences.getInstance();
    final value=themeprefs.getInt('themeprefs');
    switch (value) {
      case 1:Themecolors.greytone();
      break;
      case 2:Themecolors.whitetone();
      break;
      case 3:Themecolors.blacktone();
      break;
      case 4:Themecolors.pinktone();
      break;
      case 5:Themecolors.greentone();
      break;
      default:Themecolors.navybluetone();
    }
  }

  static addvalue(value)async{
    final themeprefs = await SharedPreferences.getInstance();
    themeprefs.setInt('themeprefs', value);
  }

}