import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.white,
              Colors.lightBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Material(
            shape: CircleBorder(),
            elevation: 10,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/img4.jpg'),
              radius: 50,
            ),
          ),
        ),
      ),
    );
  }
}
