import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';

class ContainerDecoratedWidget extends StatelessWidget {
  /// The child of the container of type widget.
  final Widget child;

  /// Height of the container.
  final double? height;

  /// Width of the container.
  final double? width;

  /// Padding of the container.
  final EdgeInsetsGeometry? padding;

  /// Constructor of [ContainerDecoratedWidget].
  ///
  /// The container with decoration of border radius and margin.
  ///
  /// Paramaters: [child], [height], [padding] and [width].
  const ContainerDecoratedWidget(
      {super.key, required this.child, this.height, this.padding, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(UiHelper.getRadius(radius: Spacing.medium)),
        border: Border.all(
          color: AppColor.textColor.withOpacity(0.25),
        ),
      ),
      margin: UiHelper.getHorizontalPadding(spacing: Spacing.small),
      padding: padding,
      height: height,
      width: width,
      child: child,
    );
  }
}
