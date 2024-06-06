import 'package:get/get.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/repository/homepage_repository_impl.dart';

class HomePageController extends GetxController {
  ForecastModel? forecastModel = ForecastModel();

  final HomePageRepositoryImpl homePageRepositoryImpl =
      HomePageRepositoryImpl();

  Future<void> getTemperatureDetails() async {
    final data = await homePageRepositoryImpl.getCurrentTempDetails();
    if (data.successModel != null) {
      forecastModel = data.successModel;
    }
  }
}
