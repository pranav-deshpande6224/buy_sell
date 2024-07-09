import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordSeeNotsee extends StateNotifier<bool> {
  // false mean password not be seen
  // i.e obscure text is true, visibility_off
  // true mean password is seen
  // i.e obscure text is false visibility_on
  PasswordSeeNotsee() : super(false);
  void stateChange() {
    state = !state;
  }
}

final passwordProvider = StateNotifierProvider<PasswordSeeNotsee, bool>((ref) {
  return PasswordSeeNotsee();
});
