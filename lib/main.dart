import 'package:buy_sell/Home/Screens/home_screen.dart';
import 'package:buy_sell/Splash/screens/splash_screen.dart';
import 'package:buy_sell/authentication/provider/auth_state_provider.dart';
import 'package:buy_sell/authentication/screens/phone_number_screen.dart';
import 'package:buy_sell/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChange = ref.watch(authStateProvider);
    debugPrint("##################$authStateChange");
    return authStateChange.when(
      data: (user) {
        if (user != null) {
          return const MaterialApp(home: HomeScreen());
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: PhoneNumberScreen(),
          );
        }
      },
      error: (error, stackTrace) {
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('some error'),
            ),
          ),
        );
      },
      loading: () {
        return const MaterialApp(
          home: SplashScreen(),
        );
      },
    );
  }
}
