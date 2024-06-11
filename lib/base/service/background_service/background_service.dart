import 'dart:ui';

import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/extension/asset_extension.dart';

class BackgroundService {
  static final hour = DateTime.now().hour;
  static String getBackgroundImage() {
    if (hour >= 6 && hour < 18) {
      return 'day_cloud'.getPngImage;
    } else if (hour >= 18 && hour < 21) {
      return 'evening_sky'.getPngImage;
    } else {
      return 'night_cloud'.getPngImage;
    }
  }

  static Color getAppBarColor() {
    if (hour >= 6 && hour < 18) {
      return AppColor.dayThemeColor;
    } else if (hour >= 18 && hour < 21) {
      return AppColor.eveningThemeLightColor;
    } else {
      return AppColor.themeColor;
    }
  }

  static List<Color> getBackgroundColor() {
    if (hour >= 6 && hour < 18) {
      return [
        AppColor.dayThemeColor,
        AppColor.dayThemeLightColor,
      ];
    } else if (hour >= 18 && hour < 21) {
      return [
        AppColor.eveningThemeColor,
        AppColor.eveningThemeLightColor,
      ];
    } else {
      return [
        AppColor.themeColor,
        AppColor.themeLightColor,
      ];
    }
  }

  static List<Color> getContainerGradient() {
    if (hour >= 6 && hour < 18) {
      return [
        AppColor.dayThemeColor2.withOpacity(0),
        AppColor.dayThemeColor2,
        AppColor.dayThemeColor2,
        AppColor.dayThemeColor2.withOpacity(0)
      ];
    } else if (hour >= 18 && hour < 21) {
      return [
        AppColor.eveningThemeColor2.withOpacity(0),
        AppColor.eveningThemeColor2,
        AppColor.eveningThemeColor2,
        AppColor.eveningThemeColor2.withOpacity(0)
      ];
    } else {
      return [
        AppColor.themeColor2.withOpacity(0),
        AppColor.themeColor2,
        AppColor.themeColor2,
        AppColor.themeColor2.withOpacity(0)
      ];
    }
  }
}
