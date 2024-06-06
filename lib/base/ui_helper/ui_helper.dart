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
///* [getHorizontalPadding] Provide padding with horizontal spacing.
///* [getVerticalPadding] Provide padding with vertical spacing.
///* [getSymmetricPadding] Provide padding with both horizontal and vertical spacing.
///* [getOnlyPadding] Provide padding with optional left, top, right and bottom spacing.
///* [getHorizontalSpacing] Provides a double spacing value for horizontal spacing.
///* [getVerticalSpacing] Provides a double spacing value for vertical spacing.
///* [getRadius] Provides a double radius value.
///* [_getSpacing] Retrieves the spacing value for a given Spacing enum.
class UiHelper {
  /// Provides padding with horizontal spacing.
  ///
  /// [spacing] The horizontal spacing value default set to 20.
  static EdgeInsetsGeometry getHorizontalPadding(
      {Spacing spacing = Spacing.medium}) {
    return EdgeInsets.symmetric(
      horizontal: _getSpacing(spacing),
    );
  }

  /// Provides padding with vertical spacing.
  ///
  ///* [spacing] The vertical spacing value default set to 20.
  static EdgeInsetsGeometry getVerticalPadding(
      {Spacing spacing = Spacing.medium}) {
    return EdgeInsets.symmetric(
      vertical: _getSpacing(spacing),
    );
  }

  /// Provides padding with both horizontal and vertical spacing.
  ///
  ///* [horizontal] ```The horizontal spacing value default set to 20```.
  ///* [vertical] The vertical spacing value default set to 20.
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
  /// [left] The left spacing value default set to 0.
  /// [top] The top spacing value default set to 0.
  /// [right] The right spacing value default set to 0.
  /// [bottom] The bottom spacing value default set to 0.
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
  /// [spacing] The horizontal spacing value default set to 10.
  static SizedBox getHorizontalSpacing({Spacing spacing = Spacing.small}) {
    return SizedBox(
      width: _getSpacing(spacing),
    );
  }

  /// Provides a  vertical spacing.
  ///
  /// [spacing] The vertical spacing value default set to 10.
  static SizedBox getVerticalSpacing({Spacing spacing = Spacing.small}) {
    return SizedBox(
      height: _getSpacing(spacing),
    );
  }

  /// Provides a double radius value.
  ///
  /// [radius] The radius value default set to 0.
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
