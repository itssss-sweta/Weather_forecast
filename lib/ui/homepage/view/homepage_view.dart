import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/view_model/homepage_controller.dart';
import 'package:weather_forecast/ui/homepage/widgets/current_weather_highlights_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/days_forecast_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/hourly_forecast_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/splash_screen.dart';
import 'package:weather_forecast/ui/widgets/background_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return const SplashScreen();
          }
          return BackgroundWidget(
            topContents: CurrentWeatherHighlightsWidget(
                currentWeather: controller.forecastModel.value),
            bottomContents: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HourlyForecastWidget(
                          forecastModel: controller.forecastModel.value),
                      UiHelper.getVerticalSpacing(spacing: Spacing.small),
                      DaysForecastWidget(
                          forecastModel: controller.forecastModel.value),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
