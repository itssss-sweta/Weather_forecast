import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/service/background_service/background_service.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/repository/homepage_repository_impl.dart';

class HomePageController extends GetxController {
  Rx<String> backgroundImage = ''.obs;

  RxList<Color> backgroundColors = <Color>[].obs;
  RxList<Color> containerGradient = <Color>[].obs;
  Rx<Color> appBarColor = AppColor.dayThemeColor.withOpacity(0.2).obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    backgroundImage.value = BackgroundService.getBackgroundImage();
    backgroundColors.value = BackgroundService.getBackgroundColor();
    containerGradient.value = BackgroundService.getContainerGradient();
    appBarColor.value = BackgroundService.getAppBarColor();
    getWeatherDetails();
  }

  /// Variable to store the loaded data of [ForecastModel] type.
  final Rx<ForecastModel?> forecastModel = ForecastModel().obs;

  /// Boolean to keep track of data.
  Rx<bool> isLoading = false.obs;

  /// Boolean to keep track of search data is fetched.
  Rx<bool> isSearchDataLoading = false.obs;

  final HomePageRepositoryImpl homePageRepositoryImpl =
      HomePageRepositoryImpl();

  /// Stores the weather details fetched from repository in `forecastModel` variable.
  ///
  /// Also updates `isLoading` boolean for update of ui accordingly.
  Future<void> getWeatherDetails() async {
    try {
      isLoading(true);
      update();
      await Future.delayed(const Duration(seconds: 2));
      final data = await homePageRepositoryImpl.getCurrentTempDetails();
      forecastModel.value = data.successModel;
    } finally {
      isLoading(false);
      update();
    }
  }

  /// Stores the weather details fetched from repository in `forecastModel` variable according to search query
  ///
  /// Also updates `isLoading` boolean for update of ui accordingly.
  Future<void> getSearchWeatherDetails() async {
    try {
      isSearchDataLoading(true);
      update();
      await Future.delayed(const Duration(seconds: 2));
      final data = await homePageRepositoryImpl.getSearchCurrentTempDetails(
          city: searchController.text);
      forecastModel.value = data.successModel;
    } finally {
      isSearchDataLoading(false);
      update();
    }
  }
}
