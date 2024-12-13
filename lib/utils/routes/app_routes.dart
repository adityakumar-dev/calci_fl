import 'package:calci_fl/screens/Home/home_screen.dart';
import 'package:calci_fl/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Route<dynamic>? appRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return getPageTransition(const SplashScreen(), routeSettings);
      case HomeScreen.routeName:
        return getPageTransition(const HomeScreen(), routeSettings);
      default:
        MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route Not Found"),
            ),
          ),
        );
    }
    return null;
  }

  static getPageTransition(dynamic screenName, RouteSettings routeSettings) {
    return PageTransition(
      child: screenName,
      type: PageTransitionType.theme,
      alignment: Alignment.center,
      settings: routeSettings,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 1000),
      maintainStateData: true,
    );
  }
}
