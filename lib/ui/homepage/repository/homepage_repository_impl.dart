import 'dart:convert';
import 'package:weather_forecast/base/service/location_service/location_access.dart';
import 'package:weather_forecast/ui/homepage/model/error_model.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';
import 'package:weather_forecast/ui/homepage/repository/homepage_repository.dart';
import 'package:weather_forecast/ui/homepage/service/homepage_service.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  @override
  Future<({ForecastModel? successModel, ErrorModel? errorModel})>
      getCurrentTempDetails() async {
    final latitude = LocationAccess.currentPosition.latitude;
    final longitude = LocationAccess.currentPosition.longitude;

    final temperatureResponse = await HomePageService.getTemperatureDetails(
        latitude: latitude, longitude: longitude);
    if (temperatureResponse.statusCode >= 200 &&
        temperatureResponse.statusCode < 300) {
      final decodedJson = jsonDecode(temperatureResponse.body);
      return (
        successModel: ForecastModel.fromJson(decodedJson),
        errorModel: null
      );
    }
    final decodedJson = jsonDecode(temperatureResponse.body);
    return (successModel: null, errorModel: ErrorModel.fromJson(decodedJson));
  }
}
