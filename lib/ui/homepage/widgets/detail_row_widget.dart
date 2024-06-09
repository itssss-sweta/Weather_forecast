import 'package:flutter/material.dart';
import 'package:weather_forecast/ui/homepage/widgets/detail_measure_widget.dart';

/// The row consists of two [DetailMeasureWidget] widgets where the
/// other weather detail's value and name are given.
class DetailRowWidget extends StatelessWidget {
  /// Icon to be displayed at row children first.
  final IconData icon1;

  /// Icon to be displayed at row children second.
  final IconData icon2;

  /// Title to be displayed at row children first.
  final String? measureTitle1;

  /// Title to be displayed at row children second.
  final String? measureTitle2;

  /// Value to be displayed at row children first.
  final String? measureValue1;

  /// Value to be displayed at row children second.
  final String? measureValue2;

  /// Value if temperature to be displayed at row children first.
  final String? measureTempValue1;

  /// Value if temperature to be displayed at row children second.
  final String? measureTempValue2;

  /// Constructor of [DetailRowWidget].
  ///
  /// The row consists of two [DetailMeasureWidget] widgets where the other weather detail's value and name are given.
  ///
  /// Parametes: [icon1],[icon2],[measureTitle1],[measureTitle2],[measureValue1],[measureValue2],
  /// [measureTempValue1] and [measureTempValue2].
  const DetailRowWidget(
      {super.key,
      required this.icon1,
      required this.icon2,
      this.measureTitle1,
      this.measureTitle2,
      this.measureValue1,
      this.measureValue2,
      this.measureTempValue1,
      this.measureTempValue2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DetailMeasureWidget(
          icon: icon1,
          measureTitle: measureTitle1 ?? '',
          measureValue: measureValue1,
          measureTempValue: measureTempValue1 ?? '',
        ),
        DetailMeasureWidget(
          icon: icon2,
          measureTitle: measureTitle2 ?? '',
          measureValue: measureValue2,
          measureTempValue: measureTempValue2 ?? '',
        ),
      ],
    );
  }
}
