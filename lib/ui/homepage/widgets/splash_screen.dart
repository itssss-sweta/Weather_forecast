import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.themeColor,
      body: Center(
        child: Text(
          'Weather-Forecast',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
