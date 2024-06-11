import 'package:flutter/material.dart';

/// Enum class that defines the different sizes.
///* [none] =0
///* [xSmall] =5.
///* [small] = 10.
///* [xMedium] = 15.
///* [medium] = 20.
///* [large] = 25.
///* [xLarge] = 30.
///* [xlLarge] = 35.0
///* [xxlLarge] = 40.0
enum Spacing {
  none,
  xSmall,
  small,
  xMedium,
  medium,
  large,
  xLarge,
  xlLarge,
  xxlLarge
}

/// Helper class that has several methods listed below
class UiHelper {
  /// Provides padding with horizontal spacing.
  ///
  /// - Default spacing set to 20.
  static EdgeInsetsGeometry getHorizontalPadding(
      {Spacing spacing = Spacing.medium}) {
    return EdgeInsets.symmetric(
      horizontal: _getSpacing(spacing),
    );
  }

  /// Provides padding with vertical spacing.
  ///
  ///- Default spacing set to 20.
  static EdgeInsetsGeometry getVerticalPadding(
      {Spacing spacing = Spacing.medium}) {
    return EdgeInsets.symmetric(
      vertical: _getSpacing(spacing),
    );
  }

  /// Provides padding with both horizontal and vertical spacing.
  ///
  ///- Default spacing set to 20.
  static EdgeInsetsGeometry getSymmetricPadding(
      {Spacing horizontal = Spacing.medium,
      Spacing vertical = Spacing.medium}) {
    return EdgeInsets.symmetric(
      horizontal: _getSpacing(horizontal),
      vertical: _getSpacing(vertical),
    );
  }

  /// Provides padding with optional left, top, right, and bottom spacing.
  ///
  ///- Default spacing set to 0.

  static EdgeInsetsGeometry getOnlyPadding({
    Spacing left = Spacing.none,
    Spacing top = Spacing.none,
    Spacing right = Spacing.none,
    Spacing bottom = Spacing.none,
  }) {
    return EdgeInsets.only(
      left: _getSpacing(left),
      top: _getSpacing(top),
      right: _getSpacing(right),
      bottom: _getSpacing(bottom),
    );
  }

  /// Provides a horizontal spacing.
  ///
  ///- Default spacing set to 10.
  static SizedBox getHorizontalSpacing({Spacing spacing = Spacing.small}) {
    return SizedBox(
      width: _getSpacing(spacing),
    );
  }

  /// Provides a  vertical spacing.
  ///
  ///- Default spacing set to 10.
  static SizedBox getVerticalSpacing({Spacing spacing = Spacing.small}) {
    return SizedBox(
      height: _getSpacing(spacing),
    );
  }

  /// Provides a double radius value.
  ///
  ///- Default radius set to 10.
  static double getRadius({Spacing radius = Spacing.medium}) {
    return _getSpacing(radius);
  }

  /// Retrieves the spacing value for a given Spacing enum.
  ///
  /// [spacing] The Spacing enum value.
  static double _getSpacing(Spacing spacing) {
    switch (spacing) {
      case Spacing.none:
        return 0;
      case Spacing.xSmall:
        return 5;
      case Spacing.small:
        return 10;
      case Spacing.xMedium:
        return 15;
      case Spacing.medium:
        return 20;
      case Spacing.large:
        return 25;
      case Spacing.xLarge:
        return 30;
      case Spacing.xlLarge:
        return 35;
      case Spacing.xxlLarge:
        return 40;
      default:
        return 10;
    }
  }
}
