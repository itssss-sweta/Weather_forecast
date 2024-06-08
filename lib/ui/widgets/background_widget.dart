import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:weather_forecast/ui/background_controller/background_controller.dart';

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
      body: GetBuilder<BackgroundController>(
          init: BackgroundController(),
          builder: (controller) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: controller.backgroundColors,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      GetBuilder<BackgroundController>(builder: (controller) {
                        return Image.asset(
                          controller.backgroundImage.value,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height / 2,
                        );
                      }),
                      // Positioned(
                      //   child: Image.asset(
                      //     'stars'.getPngImage,
                      //     fit: BoxFit.cover,
                      //     width: double.infinity,
                      //   ),
                      // ),
                      topContents ?? const SizedBox.shrink(),
                    ],
                  ),
                  GetBuilder<BackgroundController>(builder: (controller) {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.0, 0.29, 0.67, 1.0],
                            colors: controller.containerGradient,
                          ),
                        ),
                        child: bottomContents,
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
      bottomNavigationBar:
          GetBuilder<BackgroundController>(builder: (controller) {
        return BottomNavigationBar(
          elevation: 0,
          backgroundColor: controller.buttomNavBarColor.value,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC'),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC'),
          ],
        );
      }),
    );
  }
}
