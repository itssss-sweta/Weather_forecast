import 'package:flutter/material.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/widgets/temperature_text_widget.dart';

class CurrentWeatherHighlightsWidget extends StatelessWidget {
  const CurrentWeatherHighlightsWidget({
    super.key,
    required this.currentWeather,
  });

  final ForecastModel? currentWeather;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Obx(
          //   () =>
          Text("${currentWeather?.location?.name}",
              style: Theme.of(context).textTheme.titleMedium),
          // ),
          // Obx(
          //   () =>
          TemperatureTextWidget(
            temperature: "${currentWeather?.current?.tempC}",
            superScriptStyle: Theme.of(context).textTheme.titleLarge,
            temptStyle: Theme.of(context).textTheme.titleLarge,
          ),
          // ),
          // Obx(
          //   () =>
          Text(
            "${currentWeather?.current?.condition?.text}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Obx(
              //   () =>
              TemperatureTextWidget(
                temperature: "Wind:${currentWeather?.current?.windDegree}",
                superScriptStyle: Theme.of(context).textTheme.titleSmall,
                temptStyle: Theme.of(context).textTheme.titleSmall,
              ),
              // ),
              UiHelper.getHorizontalSpacing(spacing: Spacing.medium),
              // Obx(
              //   () =>
              Text(
                "H:${currentWeather?.current?.humidity}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
