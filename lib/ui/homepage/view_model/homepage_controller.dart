import 'package:get/get.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/repository/homepage_repository_impl.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getWeatherDetails();
  }

  /// Variable to store the loaded data of [ForecastModel] type.
  final Rx<ForecastModel?> forecastModel = ForecastModel().obs;

  /// Boolean to keep track of data.
  Rx<bool> isLoading = false.obs;

  final HomePageRepositoryImpl homePageRepositoryImpl =
      HomePageRepositoryImpl();

  /// Stores the weather details fetched from repository in `forecastModel` variable.
  ///
  /// Also updates `isLoading` boolean for update of ui accordingly.
  Future<void> getWeatherDetails() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      final data = await homePageRepositoryImpl.getCurrentTempDetails();
      forecastModel.value = data.successModel;
    } finally {
      isLoading(false);
      update();
    }
  }
}
