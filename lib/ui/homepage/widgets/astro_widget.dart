import 'package:flutter/material.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/widgets/weather_forecast_widget.dart';

class AstroWidget extends StatelessWidget {
  /// The name of astrological rising.
  final String riseName;

  /// The name of astrological setting.
  final String setName;

  /// The value of astrological setting.
  final String setValue;

  /// The value of astrological rising.
  final String riseValue;

  /// Constructor for [AstroWidget].
  ///
  /// Keeps the information of the astro like sunrise, sunset, moonrise and moonset.
  /// Paramaters: [riseName],[riseValue],[setName] and [setValue].
  const AstroWidget({
    super.key,
    required this.riseName,
    required this.setName,
    required this.setValue,
    required this.riseValue,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerDecoratedWidget(
      width: MediaQuery.sizeOf(context).width,
      padding: UiHelper.getSymmetricPadding(
          horizontal: Spacing.large, vertical: Spacing.large),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                riseName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                riseValue,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18),
              )
            ],
          ),
          Column(
            children: [
              Text(
                setName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                setValue,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}
