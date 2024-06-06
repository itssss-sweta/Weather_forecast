import 'dart:developer';
import 'package:weather_forecast/base/network/endpoints.dart';
import 'package:http/http.dart' as http;

class HomePageService {
  static Future<http.Response> getTemperatureDetails(
      {required num latitude, required num longitude}) async {
    String url =
        '${NetworkEndpoints.baseUrl}current.json?q=$latitude,$longitude&key=${NetworkEndpoints.apiKey}';
    final response = await http.get(Uri.parse(url));
    log(response.body);
    log(response.statusCode.toString());
    return response;
  }
}
