import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/extension/asset_extension.dart';

class BackgroundWidget extends StatelessWidget {
  /// Contents in the screen inside the image of type Widget
  final Widget? topContents;

  /// Contents in the screen as bottom outside of image of type Widget
  final Widget? bottomContents;

  /// Constructor for `BackgroundWidget`.
  ///
  /// The background decoration of the screens in application, consisting
  /// base buttom navigation bar as well.
  ///
  /// Paramaters: [topContents], [bottomContents].
  const BackgroundWidget({super.key, this.topContents, this.bottomContents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.themeColor,
              AppColor.themeLightColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'cloud'.getPngImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  child: Image.asset(
                    'stars'.getPngImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                topContents ?? const SizedBox.shrink(),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.29, 0.67, 1.0],
                    colors: [
                      AppColor.themeColor2.withOpacity(0),
                      AppColor.themeColor2,
                      AppColor.themeColor2,
                      AppColor.themeColor2.withOpacity(0)
                    ],
                  ),
                ),
                child: bottomContents,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.buttomNavColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC'),
        ],
      ),
    );
  }
}
