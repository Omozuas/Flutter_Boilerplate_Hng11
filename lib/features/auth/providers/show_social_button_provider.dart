import 'package:flutter_riverpod/flutter_riverpod.dart';

// To hide the google button when form is to be used
final showSocialButtonsProvider =
    StateNotifierProvider<ShowSocialButtonsNotifier, bool>((ref) {
  return ShowSocialButtonsNotifier();
});

class ShowSocialButtonsNotifier extends StateNotifier<bool> {
  ShowSocialButtonsNotifier() : super(true);

  void hideSocialButtons() {
    state = false;
  }

  void showSocialButtons() {
    state = true;
  }
}
