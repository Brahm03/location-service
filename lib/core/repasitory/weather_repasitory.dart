import 'package:dio/dio.dart';
import 'package:weather_app/core/models/weather_api_model.dart';
import 'package:weather_app/core/utils/location_service.dart';

class WeatherRepasitory {
  static Future<WeatherModel> getData(String cityName) async {
    try {
      final Response response = await Dio().get(
          "http://api.weatherapi.com/v1/current.json?key=82b1e4ac40b94a6183c60136240408&q=${LocationService.latitude},${LocationService.longitude}&aqi=no");
      print("Status code ${response.statusCode}");
      print("Status message ${response.statusMessage}");
      print("Status body ${response.data}");
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<WeatherModel> getSearch(String cityName) async {
    try {
      final Response response = await Dio().get(
          "http://api.weatherapi.com/v1/current.json?key=82b1e4ac40b94a6183c60136240408&q=$cityName&aqi=no");
      print("Status code ${response.statusCode}");
      print("Status message ${response.statusMessage}");
      print("Status body ${response.data}");
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
