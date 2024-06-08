import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/service/background_service/background_service.dart';

class BackgroundController extends GetxController {
  Rx<String> backgroundImage = ''.obs;

  RxList<Color> backgroundColors = <Color>[].obs;
  RxList<Color> containerGradient = <Color>[].obs;
  Rx<Color> buttomNavBarColor = AppColor.buttomNavColor.obs;
  @override
  void onInit() {
    super.onInit();
    backgroundImage.value = BackgroundService.getBackgroundImage();
    backgroundColors.value = BackgroundService.getBackgroundColor();
    containerGradient.value = BackgroundService.getContainerGradient();
    buttomNavBarColor.value = BackgroundService.getBottomNavColor();
  }
}
