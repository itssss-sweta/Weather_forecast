import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/widgets/weather_forecast_widget.dart';
import 'package:weather_forecast/ui/widgets/temperature_text_widget.dart';

/// Widget to keep the data of the any of the weather detail.
class DetailMeasureWidget extends StatelessWidget {
  /// Icon related to the detail.
  final IconData icon;

  /// Title related to the detail.
  final String measureTitle;

  /// Value of the detail.
  final String? measureValue;

  /// Value of the detail incase in terms of temperature.
  final String? measureTempValue;

  /// Widget to keep the data of the any of the weather detail.
  ///
  /// Paramaters: [icon], [measureTitle],[measureValue] and [measureTempValue].
  const DetailMeasureWidget(
      {super.key,
      required this.icon,
      required this.measureTitle,
      this.measureValue,
      this.measureTempValue});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ContainerDecoratedWidget(
        padding: UiHelper.getSymmetricPadding(
            horizontal: Spacing.large, vertical: Spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColor.iconColor,
                ),
                UiHelper.getHorizontalSpacing(spacing: Spacing.xSmall),
                Text(
                  measureTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            (measureTempValue != null && measureTempValue != '')
                ? TemperatureTextWidget(
                    temperature: measureTempValue ?? '0',
                    superScriptStyle: Theme.of(context).textTheme.bodySmall,
                    temptStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 20))
                : Text(
                    measureValue ?? '0',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 20),
                  ),
          ],
        ),
      ),
    );
  }
}
