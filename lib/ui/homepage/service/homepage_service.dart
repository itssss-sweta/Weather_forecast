import 'dart:developer';
import 'package:weather_forecast/base/network/endpoints.dart';
import 'package:http/http.dart' as http;

class HomePageService {
  static Future<http.Response> getTemperatureDetails(
      {required num latitude, required num longitude}) async {
    String url =
        '${NetworkEndpoints.baseUrl}forecast.json?q=$latitude,$longitude&days=8&key=${NetworkEndpoints.apiKey}';
    final response = await http.get(Uri.parse(url));
    log(response.body);
    log(response.statusCode.toString());
    return response;
  }

  static Future<http.Response> getSearchTemperatureDetails(
      {required String city}) async {
    String url =
        '${NetworkEndpoints.baseUrl}forecast.json?q=$city&days=8&key=${NetworkEndpoints.apiKey}';
    final response = await http.get(Uri.parse(url));
    log(response.body);
    log(response.statusCode.toString());
    return response;
  }
}
