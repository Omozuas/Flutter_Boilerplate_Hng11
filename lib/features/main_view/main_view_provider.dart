import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarIndexProvider = StateNotifierProvider<MainViewNotifier, int>(
  (ref) => MainViewNotifier(),
);

class MainViewNotifier extends StateNotifier<int> {
  MainViewNotifier() : super(0);

  void setIndex(int index) {
    state = index;
  }
}
