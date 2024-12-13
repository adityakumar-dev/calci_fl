import 'package:calci_fl/screens/splash/splash_screen.dart';
import 'package:calci_fl/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calci());
}

class Calci extends StatelessWidget {
  const Calci({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: AppRoutes.appRoutes,
    );
  }
}
