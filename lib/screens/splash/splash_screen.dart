// ignore_for_file: use_build_context_synchronously

import 'package:calci_fl/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "SPLASHSCREEN";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return const Scaffold(
      body: Center(
        child: Text("CALCI"),
      ),
    );
  }
}
