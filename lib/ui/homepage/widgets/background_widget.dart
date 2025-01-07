import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/view_model/homepage_controller.dart';
import 'package:weather_forecast/ui/homepage/widgets/header_widget.dart';

class BackgroundWidget extends StatelessWidget {
  /// Contents in the screen inside the image of type Widget
  final Widget? topContents;

  /// Contents in the screen as bottom outside of image of type Widget
  final Widget? bottomContents;

  /// Constructor for `BackgroundWidget`.
  ///
  /// The background decoration of the screens in application
  /// which includes images and background colors.
  ///
  /// Paramaters: [topContents], [bottomContents].
  const BackgroundWidget({super.key, this.topContents, this.bottomContents});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: controller.appBarColor.value,
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    scrolledUnderElevation: 0,
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    expandedHeight: MediaQuery.sizeOf(context).height / 2,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          GetBuilder<HomePageController>(builder: (controller) {
                            return Image.asset(
                              controller.backgroundImage.value,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height / 2,
                            );
                          }),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Column(
                              children: [
                                const HeaderWidget(),
                                UiHelper.getVerticalSpacing(
                                    spacing: Spacing.small),
                                topContents != null
                                    ? topContents!
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 20,
                  )),
                  SliverToBoxAdapter(
                    child:
                        GetBuilder<HomePageController>(builder: (controller) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.0, 0.29, 0.67, 1.0],
                            colors: controller.containerGradient,
                          ),
                        ),
                        child: bottomContents,
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
