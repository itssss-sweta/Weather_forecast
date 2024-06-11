import 'package:weather_forecast/base/extension/find_day_extension.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/widgets/weather_forecast_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/temperature_text_widget.dart';

/// Widget that lists out the forecast upto 8 days from current day.
class DaysForecastWidget extends StatelessWidget {
  final ForecastModel? forecastModel;

  /// Constructor of [DaysForecastWidget].
  ///
  /// Widget that lists out the forecast upto 8 days from current day.
  ///
  /// Paramater: [forecastModel].
  const DaysForecastWidget({super.key, required this.forecastModel});

  @override
  Widget build(BuildContext context) {
    return ContainerDecoratedWidget(
      padding: UiHelper.getOnlyPadding(left: Spacing.small, top: Spacing.small),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: AppColor.iconColor,
              ),
              UiHelper.getHorizontalSpacing(spacing: Spacing.small),
              Text(
                '8-DAY FORECAST',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: forecastModel?.forecast?.forecastday?.length ?? 5,
            itemBuilder: (context, index) {
              final daysForecast = forecastModel?.forecast?.forecastday?[index];
              return ListTile(
                leading: SizedBox(
                  width: 80,
                  child: Text(
                    daysForecast?.date?.getDayName ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                title: Row(
                  children: [
                    Image.network(
                      'https:${daysForecast?.day?.condition?.icon}',
                      width: 50,
                    ),
                    TemperatureTextWidget(
                      temperature: daysForecast?.day?.mintempC.toString() ?? '',
                      temptStyle: Theme.of(context).textTheme.bodyMedium,
                      superScriptStyle: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                trailing: TemperatureTextWidget(
                  temperature: daysForecast?.day?.maxtempC.toString() ?? '',
                  temptStyle: Theme.of(context).textTheme.bodyMedium,
                  superScriptStyle: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
