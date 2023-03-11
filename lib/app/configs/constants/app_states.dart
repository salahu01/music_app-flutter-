//* State
import 'package:flutter/material.dart';

enum KState { loading, loaded, empty, error }

//* State Provider
abstract class SateProvider extends ChangeNotifier {

  //* This methord for update ui
  void update(void Function() update) {
    update();
    notifyListeners();
  }

  //* This methord for get Widget depend on state
  static Widget widget({required KState state, required Widget loaded, Widget? loading, Widget? empty, Widget? error}) {
    return {KState.loading: loading, KState.empty: empty, KState.error: error}[state] ?? loaded;
  }
}
