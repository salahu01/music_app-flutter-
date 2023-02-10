import 'package:flutter/material.dart';

class MainPageController extends ChangeNotifier {
  // geters
  int get index => _index;
  String get title => _title;
  PageController get pageConteroller => _pageController;

  // values
  final _pageController = PageController(initialPage: 1);
  int _index = 1;
  String _title = 'Musics';
  final _titles = ['PlayLists', 'Musics', 'Favourite', 'Settings'];

  // seters
  void changeIndex(int index) {
    _pageController.jumpToPage(index);
    updateTitle(index);
  }

  void changePage(int index) {
    _index = index;
    updateTitle(index);
  }

  void updateTitle(int index) {
    _title = _titles[index];
    notifyListeners();
  }
}
