import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/widgets/weather_forecast_widget.dart';
import 'package:weather_forecast/ui/widgets/temperature_text_widget.dart';
import 'package:weather_forecast/base/extension/format_time_extension.dart';

class HourlyForecastWidget extends StatelessWidget {
  final ForecastModel? forecastModel;
  const HourlyForecastWidget({super.key, required this.forecastModel});

  @override
  Widget build(BuildContext context) {
    return WeatherForecastWidget(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          final List<Forecastday>? forecastList =
              forecastModel?.forecast?.forecastday;
          if (forecastList != null && forecastList.isNotEmpty) {
            final forecastDay = forecastList.first.hour?[index];
            return Padding(
              padding: UiHelper.getSymmetricPadding(
                  horizontal: Spacing.small, vertical: Spacing.medium),
              child: Column(
                children: [
                  Text(
                    forecastDay?.time?.formatTime ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  UiHelper.getVerticalSpacing(spacing: Spacing.small),
                  Image.network(
                    'https:${forecastDay?.condition?.icon ?? ''}',
                    height: 60,
                    color: AppColor.iconColor,
                  ),
                  UiHelper.getVerticalSpacing(spacing: Spacing.small),
                  TemperatureTextWidget(
                    temperature: forecastDay?.tempC.toString() ?? '',
                    temptStyle: Theme.of(context).textTheme.labelLarge,
                    superScriptStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
