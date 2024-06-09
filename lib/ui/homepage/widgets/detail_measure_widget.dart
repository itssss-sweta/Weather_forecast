import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/widgets/weather_forecast_widget.dart';
import 'package:weather_forecast/ui/widgets/temperature_text_widget.dart';

class DetailMeasureWidget extends StatelessWidget {
  final IconData icon;
  final String measureTitle;
  final String? measureValue;
  final String? measureTempValue;
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
