import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButtonStateProvider extends StateNotifier<bool> {
  LoginButtonStateProvider() : super(false);
  void changeStateOfButton(String phoneNumber) {
    if (phoneNumber.length == 10) {
      state = true;
    } else {
      if (state == false) return;
      state = false;
    }
  }
}

final buttonStateProvider =
    StateNotifierProvider<LoginButtonStateProvider, bool>((ref) {
  return LoginButtonStateProvider();
});
