import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/extension/asset_extension.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/repository/homepage_repository_impl.dart';

class HomePageController extends GetxController {
  Rx<String> backgroundImage = ''.obs;

  Rx<String> error = ''.obs;

  RxList<Color> backgroundColors = <Color>[].obs;
  RxList<Color> containerGradient = <Color>[].obs;
  Rx<Color> appBarColor = AppColor.dayThemeColor.withOpacity(0.2).obs;

  TextEditingController searchController = TextEditingController();

  RxInt currentHour = DateTime.now().hour.obs;

  @override
  void onInit() {
    super.onInit();
    changeBackground();
    getWeatherDetails();
  }

  void changeBackground() {
    backgroundImage.value = getBackgroundImage();
    backgroundColors.value = getBackgroundColor();
    containerGradient.value = getContainerGradient();
    appBarColor.value = getAppBarColor();
  }

  String getBackgroundImage() {
    if (currentHour >= 6 && currentHour < 18) {
      return 'day_cloud'.getPngImage;
    } else if (currentHour >= 18 && currentHour < 21) {
      return 'evening_sky'.getPngImage;
    } else {
      return 'night_cloud'.getPngImage;
    }
  }

  Color getAppBarColor() {
    if (currentHour >= 6 && currentHour < 18) {
      return AppColor.dayThemeColor;
    } else if (currentHour >= 18 && currentHour < 21) {
      return AppColor.eveningThemeLightColor;
    } else {
      return AppColor.themeColor;
    }
  }

  List<Color> getBackgroundColor() {
    if (currentHour >= 6 && currentHour < 18) {
      return [
        AppColor.dayThemeColor,
        AppColor.dayThemeLightColor,
      ];
    } else if (currentHour >= 18 && currentHour < 21) {
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

  List<Color> getContainerGradient() {
    if (currentHour >= 6 && currentHour < 18) {
      return [
        AppColor.dayThemeColor2.withOpacity(0),
        AppColor.dayThemeColor2,
        AppColor.dayThemeColor2,
        AppColor.dayThemeColor2.withOpacity(0)
      ];
    } else if (currentHour >= 18 && currentHour < 21) {
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
      final data = await homePageRepositoryImpl.getCurrentTempDetails();
      forecastModel.value = data.successModel;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading(false);
      update();
    }
  }

  /// Stores the weather details fetched from repository in `forecastModel` variable according to search query
  ///
  /// Also updates `isSearchDataLoading` boolean for update of ui accordingly.
  Future<void> getSearchWeatherDetails() async {
    try {
      isSearchDataLoading(true);
      update();
      if (searchController.text.isEmpty) {
        await getWeatherDetails();
      } else {
        isLoading(true);
        update();
        final data = await homePageRepositoryImpl.getSearchCurrentTempDetails(
            city: searchController.text);
        forecastModel.value = data.successModel;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isSearchDataLoading(false);
      isLoading(false);
      DateTime currentTime =
          DateTime.parse(forecastModel.value?.location?.localtime ?? '');
      currentHour.value = currentTime.hour;
      changeBackground();
      update();
    }
  }
}
