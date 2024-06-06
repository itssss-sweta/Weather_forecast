import 'package:weather_forecast/ui/homepage/model/error_model.dart';
import 'package:weather_forecast/ui/homepage/model/forecast_model.dart';

abstract class HomePageRepository {
  Future<({ForecastModel? successModel, ErrorModel? errorModel})>
      getCurrentTempDetails();
}
