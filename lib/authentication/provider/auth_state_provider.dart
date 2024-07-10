import 'package:buy_sell/authentication/provider/auth_handler_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<User?>(
  (ref) {
    return ref.read(authHandlerProvider).auth.authStateChanges();
  },
);
