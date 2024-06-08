import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';

class WeatherForecastWidget extends StatelessWidget {
  final Widget child;
  const WeatherForecastWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(UiHelper.getRadius(radius: Spacing.medium)),
        border: Border.all(
          color: AppColor.textColor.withOpacity(0.25),
        ),
      ),
      margin: UiHelper.getHorizontalPadding(spacing: Spacing.small),
      height: 180,
      child: child,
    );
  }
}