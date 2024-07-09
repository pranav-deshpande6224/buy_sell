import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpButtonStateProvider extends StateNotifier<bool> {
  OtpButtonStateProvider() : super(false);
  void changeStateOtpButton(String otp) {
    if (otp.length == 6) {
      state = true;
    } else {
      if (state == false) return;
      state = false;
    }
  }
}

final otpChangeProvider =
    StateNotifierProvider<OtpButtonStateProvider, bool>((ref) {
  return OtpButtonStateProvider();
});
