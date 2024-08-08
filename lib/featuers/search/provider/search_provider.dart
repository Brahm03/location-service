import 'package:flutter/material.dart';
import 'package:weather_app/core/models/model_weather.dart';
import 'package:weather_app/core/utils/main_provider.dart';

class WeatherProvider with ChangeNotifier {
  List<Weather> weatherList = [
    Weather(cityName: MainProvider().model!.location.name, temperature: MainProvider().model!.current.tempC.toString(), condition: MainProvider().model!.current.tempC.toString(), iconUrl: MainProvider().model!.current.tempC.toString())
  ];
  List<Weather> searchResult = [];
  List<Weather> selcectLocation = [];
  List<String> lastFiveLocation = [];

  Future<void> setWeatherList(List<Weather> weatherList) async {
    weatherList = weatherList;
    searchResult = weatherList;
    notifyListeners();
  }

  Future<void> searchWeather(String cityName) async {
    if (cityName.isEmpty) {
      searchResult = [];
      lastFiveLocation = [];
    } else {
      searchResult = weatherList
          .where((weather) =>
              weather.cityName.toLowerCase().contains(cityName.toLowerCase()))
          .toList();
      lastFiveLocation =
          searchResult.map((weather) => weather.cityName).toList();
    }
    notifyListeners();
  }

  Future<void> selectCity(String city) async {
    final weather =
        weatherList.firstWhere((weather) => weather.cityName == city);
    if (!selcectLocation.contains(weather)) {
      selcectLocation.add(weather);
    }
    lastFiveLocation = [];
    notifyListeners();
  }
}
