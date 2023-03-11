import 'package:music_app/app/configs/constants/app_states.dart';

class MusicsController extends SateProvider {
  MusicsController() {
    getMusics();
  }
  // geters
  KState get state => _state;

  // values
  KState _state = KState.loading;

  //methords
  void getMusics() async {
    await Future.delayed(const Duration(seconds: 5));
    update(() => _state = KState.loaded);
  }
}
