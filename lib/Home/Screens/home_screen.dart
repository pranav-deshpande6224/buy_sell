import 'package:buy_sell/authentication/provider/auth_handler_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () async {
              final authHandler = ref.read(authHandlerProvider);
              final instance = authHandler.auth;
              await instance.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: const Center(
        child: Text('Data in the Home Screen'),
      ),
    );
  }
}
