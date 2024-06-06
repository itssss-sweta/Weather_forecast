import 'package:flutter/material.dart';

class TemperatureTextWidget extends StatelessWidget {
  /// Value of temperature
  final String temperature;
  final TextStyle? superScriptStyle;
  final TextStyle? temptStyle;

  /// Construtor of [TemperatureTextWidget].
  ///
  /// Text Widget that holds the temperature value along with the unit.
  ///
  /// Required Parameter: [temperature].
  const TemperatureTextWidget(
      {super.key,
      required this.temperature,
      required this.superScriptStyle,
      required this.temptStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: temperature, style: temptStyle),
          TextSpan(
            text: '0',
            style: superScriptStyle
                ?.copyWith(fontFeatures: [const FontFeature.superscripts()]),
          ),
        ],
      ),
    );
  }
}
