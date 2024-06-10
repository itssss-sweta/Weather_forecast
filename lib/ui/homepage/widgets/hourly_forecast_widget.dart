import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/widgets/weather_forecast_widget.dart';
import 'package:weather_forecast/ui/widgets/temperature_text_widget.dart';
import 'package:weather_forecast/base/extension/format_time_extension.dart';

class HourlyForecastWidget extends StatelessWidget {
  /// The model that contains all the details of forecast weather of days followed by current day.
  final ForecastModel? forecastModel;

  /// Widget to show hourly temperature.
  ///
  /// Parameter: [forecastModel].
  const HourlyForecastWidget({super.key, required this.forecastModel});

  @override
  Widget build(BuildContext context) {
    final List<Forecastday>? forecastList =
        forecastModel?.forecast?.forecastday;
    final DateTime now = DateTime.now();
    final List<Hour> filteredHours = forecastList?.first.hour
            ?.where((hour) => DateTime.parse(hour.time!).isAfter(now))
            .toList() ??
        [];
    return ContainerDecoratedWidget(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredHours.length,
        itemBuilder: (context, index) {
          final forecastDay = filteredHours[index];

          return Padding(
            padding: UiHelper.getSymmetricPadding(
                horizontal: Spacing.small, vertical: Spacing.medium),
            child: Column(
              children: [
                Text(
                  forecastDay.time?.formatTime ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                UiHelper.getVerticalSpacing(spacing: Spacing.small),
                Image.network(
                  'https:${forecastDay.condition?.icon ?? ''}',
                  height: 60,
                  color: AppColor.iconColor,
                ),
                UiHelper.getVerticalSpacing(spacing: Spacing.small),
                TemperatureTextWidget(
                  temperature: forecastDay.tempC.toString(),
                  temptStyle: Theme.of(context).textTheme.labelLarge,
                  superScriptStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
