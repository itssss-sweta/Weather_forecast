import 'package:flutter/material.dart';
import 'package:weather_forecast/base/routes/routes.dart';
import 'package:weather_forecast/ui/homepage/view/homepage_view.dart';

class AppRouter {
  Route? ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        {
          return MaterialPageRoute(
            builder: (context) => const HomePageView(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (context) => const HomePageView(),
          );
        }
    }
  }
}
