import 'package:get/get.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/repository/homepage_repository_impl.dart';

class HomePageController extends GetxController {
  final Rx<ForecastModel?> forecastModel = ForecastModel().obs;
  Rx<bool> isLoading = false.obs;

  final HomePageRepositoryImpl homePageRepositoryImpl =
      HomePageRepositoryImpl();

  Future<void> getTemperatureDetails() async {
    isLoading.value = true;
    final data = await homePageRepositoryImpl.getCurrentTempDetails();
    if (data.successModel != null) {
      forecastModel.value = data.successModel;
    }
    isLoading.value = false;
  }
}
