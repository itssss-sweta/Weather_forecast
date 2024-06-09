import 'package:flutter/material.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/widgets/temperature_text_widget.dart';

/// The Highlight of the current weather includes:
/// - current temperature
/// - humidity
/// - place name
/// - condition
/// - wind degree
///
class CurrentWeatherHighlightsWidget extends StatelessWidget {
  /// The Highlight of the current weather includes:
  /// - current temperature
  /// - humidity
  /// - place name
  /// - condition
  /// - wind degree
  ///
  /// Paramater: [currentWeather]
  const CurrentWeatherHighlightsWidget({
    super.key,
    required this.currentWeather,
  });

  /// Model that stores data of the current as well ad forecast data.
  final ForecastModel? currentWeather;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${currentWeather?.location?.name}",
              style: Theme.of(context).textTheme.titleMedium),
          TemperatureTextWidget(
            temperature: "${currentWeather?.current?.tempC}",
            superScriptStyle: Theme.of(context).textTheme.titleLarge,
            temptStyle: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "${currentWeather?.current?.condition?.text}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TemperatureTextWidget(
                temperature: "Wind:${currentWeather?.current?.windDegree}",
                superScriptStyle: Theme.of(context).textTheme.titleSmall,
                temptStyle: Theme.of(context).textTheme.titleSmall,
              ),
              UiHelper.getHorizontalSpacing(spacing: Spacing.medium),
              Text(
                "H:${currentWeather?.current?.humidity}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
