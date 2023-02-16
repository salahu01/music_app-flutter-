import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:music_app/app/configs/themes/app_colors.dart';
import 'package:music_app/app/controller/main.page.controller.dart';
import 'package:music_app/app/view/pages/favourites.dart';
import 'package:music_app/app/view/pages/musics.dart';
import 'package:music_app/app/view/pages/playlists.dart';
import 'package:music_app/app/view/pages/settings.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<MainPageController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(ctrl.title),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          controller: ctrl.pageConteroller,
          onPageChanged: ctrl.changePage,
          children: const [
            PlayLists(),
            Musics(),
            Favourites(),
            Settings(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: GNav(
          tabBackgroundColor: AppColors.warm,
          textStyle: TextStyle(fontWeight: FontWeight.w700, color: AppColors.accent, fontSize: 10.sp, overflow: TextOverflow.ellipsis),
          color: AppColors.accent,
          gap: 4.sp,
          activeColor: AppColors.accent,
          padding: EdgeInsets.all(8.sp),
          tabMargin: EdgeInsets.all(12.sp),
          selectedIndex: ctrl.index,
          onTabChange: ctrl.changeIndex,
          tabs: const [
            GButton(icon: Icons.playlist_add_check, text: 'PlayLists'),
            GButton(icon: Icons.music_note_rounded, text: 'Musics'),
            GButton(icon: Icons.favorite, text: 'Favs'),
            GButton(icon: Icons.settings, text: 'Settings')
          ],
        ),
      ),
    );
  }
}
