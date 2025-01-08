import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/view_model/homepage_controller.dart';
import 'package:weather_forecast/ui/homepage/widgets/background_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/current_weather_highlights_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/days_forecast_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/hourly_forecast_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/other_weather_detail_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/splash_screen.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        if (controller.isLoading.value &&
            !controller.isSearchDataLoading.value) {
          return const SplashScreen();
        }
        return Stack(
          children: [
            BackgroundWidget(
              topContents: CurrentWeatherHighlightsWidget(
                  currentWeather: controller.forecastModel.value),
              bottomContents: Column(
                children: [
                  HourlyForecastWidget(
                      forecastModel: controller.forecastModel.value),
                  UiHelper.getVerticalSpacing(spacing: Spacing.small),
                  DaysForecastWidget(
                      forecastModel: controller.forecastModel.value),
                  UiHelper.getVerticalSpacing(spacing: Spacing.small),
                  OtherWeatherDetailWidget(
                    currentWeather: controller.forecastModel.value?.current,
                    forecastWeather: controller
                        .forecastModel.value?.forecast?.forecastday?.first,
                  ),
                ],
              ),
            ),
            if (controller.isLoading.value &&
                controller.isSearchDataLoading.value)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        );
      },
    );
  }
}
