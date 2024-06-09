import 'package:flutter/material.dart';
import 'package:weather_forecast/ui/homepage/widgets/detail_measure_widget.dart';

class DetailRowWidget extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final String? measureTitle1;
  final String? measureTitle2;
  final String? measureValue1;
  final String? measureValue2;
  final String? measureTempValue1;
  final String? measureTempValue2;

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
