import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/ui_helper/ui_helper.dart';
import 'package:weather_forecast/ui/homepage/view_model/homepage_view_model.dart';
import 'package:weather_forecast/ui/homepage/widgets/current_weather_highlights_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/days_forecast_widget.dart';
import 'package:weather_forecast/ui/homepage/widgets/hourly_forecase_widget.dart';
import 'package:weather_forecast/ui/widgets/background_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  HomePageController controller = Get.put(HomePageController());
  @override
  void initState() {
    super.initState();
    controller.getTemperatureDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      topContents: Obx(
        () => CurrentWeatherHighlightsWidget(
            currentWeather: controller.forecastModel.value),
      ),
      bottomContents: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HourlyForecastWidget(
                    forecastModel: controller.forecastModel.value),
                UiHelper.getVerticalSpacing(spacing: Spacing.small),
                DaysForecastWidget(
                    forecastModel: controller.forecastModel.value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
