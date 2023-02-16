import 'package:flutter/material.dart';
import 'package:music_app/app/configs/constants/app_states.dart';

class MusicsController extends ChangeNotifier {
  MusicsController() {
    getMusics();
  }
  // geters
  MusicsState get state => _state;

  // values
  MusicsState _state = MusicsState.isLoading;

  //methords
  void getMusics() async {
    await Future.delayed(const Duration(seconds: 5));
    _state = MusicsState.isLoaded;
    notifyListeners();
  }
}
