import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/view_model/homepage_view_model.dart';
import 'package:weather_forecast/ui/homepage/widgets/current_weather_highlights_widget.dart';
import 'package:weather_forecast/ui/widgets/background_widget.dart';
import 'package:weather_forecast/base/extension/format_time_extension.dart';
import 'package:weather_forecast/ui/widgets/temperature_text_widget.dart';

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
      topContents: CurrentWeatherHighlightsWidget(
          currentWeather: controller.forecastModel),
      bottomContents: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                final List<Forecastday>? forecastList =
                    controller.forecastModel?.forecast?.forecastday;
                if (forecastList != null && forecastList.isNotEmpty) {
                  final forecastDay = forecastList.first.hour?[index];
                  return Column(
                    children: [
                      Text(
                        forecastDay?.time?.formatTime ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Image.network(
                        forecastDay?.condition?.icon ?? '',
                        height: 50,
                        color: AppColor.iconColor,
                      ),
                      TemperatureTextWidget(
                        temperature: forecastDay?.tempC.toString() ?? '',
                        temptStyle: Theme.of(context).textTheme.bodyMedium,
                        superScriptStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
