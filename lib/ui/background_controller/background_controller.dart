import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/service/background_service/background_service.dart';

class BackgroundController extends GetxController {
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
  }
}
