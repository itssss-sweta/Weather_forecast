import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/view_model/homepage_controller.dart';

class HeaderWidget extends StatelessWidget {
  /// Constructor of [HeaderWidget].
  ///
  /// Consist of a search bar with search icon button for searching cities.
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          UiHelper.getRadius(radius: Spacing.xLarge),
        ),
        border: Border.all(
          color: AppColor.textColor,
        ),
      ),
      padding: UiHelper.getOnlyPadding(
        left: Spacing.small,
        right: Spacing.small,
      ),
      child: GetBuilder<HomePageController>(builder: (controller) {
        return TextField(
          controller: controller.searchController,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
          textAlign: TextAlign.start,
          showCursor: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            hintText: 'Search for city....',
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18, color: AppColor.textColor.withOpacity(0.5)),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            suffixIconColor: AppColor.textColor,
          ),
        );
      }),
    );
  }
}
