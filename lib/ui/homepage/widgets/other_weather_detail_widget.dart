import 'package:flutter/material.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/widgets/astro_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/detail_row_widget.dart';
import 'package:weather_forecast/base/extension/get_uv_index.dart';

class OtherWeatherDetailWidget extends StatelessWidget {
  final Current? currentWeather;
  final Forecastday? forecastWeather;
  const OtherWeatherDetailWidget(
      {super.key, required this.currentWeather, required this.forecastWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailRowWidget(
          icon1: Icons.sunny,
          icon2: Icons.visibility,
          measureTitle1: 'UV Index',
          measureTitle2: 'Visibility',
          measureValue1: currentWeather?.uv?.getUvIndex,
          measureValue2: '${currentWeather?.visKm} km',
        ),
        UiHelper.getVerticalSpacing(spacing: Spacing.small),
        DetailRowWidget(
          icon1: Icons.water_drop_outlined,
          icon2: Icons.air,
          measureTitle1: 'Humidity',
          measureTitle2: 'Wind',
          measureValue1: '${currentWeather?.humidity}%',
          measureValue2: '${currentWeather?.windKph} km/h',
        ),
        UiHelper.getVerticalSpacing(spacing: Spacing.small),
        DetailRowWidget(
          icon1: Icons.dew_point,
          icon2: Icons.av_timer,
          measureTitle1: 'Dew point',
          measureTitle2: 'Pressure',
          measureTempValue1: '${currentWeather?.dewpointC}',
          measureValue2: '${currentWeather?.pressureMb} mb',
        ),
        UiHelper.getVerticalSpacing(spacing: Spacing.small),
        AstroWidget(
            riseName: 'Sunrise',
            riseValue: '${forecastWeather?.astro?.sunrise}',
            setValue: '${forecastWeather?.astro?.sunset}',
            setName: 'Sunset'),
        UiHelper.getVerticalSpacing(spacing: Spacing.small),
        AstroWidget(
            riseName: 'Moonrise',
            riseValue: '${forecastWeather?.astro?.moonrise}',
            setValue: '${forecastWeather?.astro?.moonset}',
            setName: 'Moonset'),
        UiHelper.getVerticalSpacing(spacing: Spacing.small),
      ],
    );
  }
}
