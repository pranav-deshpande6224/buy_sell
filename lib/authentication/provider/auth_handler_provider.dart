import 'package:buy_sell/authentication/auth_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authHandlerProvider = Provider<AuthHandler>((ref) {
  return AuthHandler();
});
