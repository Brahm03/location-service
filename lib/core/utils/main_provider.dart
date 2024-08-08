import 'package:flutter/material.dart';
import 'package:weather_app/core/models/weather_api_model.dart';
import 'package:weather_app/core/repasitory/weather_repasitory.dart';

class MainProvider extends ChangeNotifier{
  // MainProvider(){
  //   getWeather("Toshkent");
  // }

  WeatherModel? model;

  WeatherStatus status = WeatherStatus.loading;
  Future<void > getWeather(cityName) async{
    try {
       final result = await WeatherRepasitory.getData(cityName);
       model = result;
       status = WeatherStatus.success;
       notifyListeners();
    } catch (e) {
      print("error message $e");
      status =WeatherStatus.error;
    }
  }
    Future<void > getSearchWeather(cityName) async{
    try {
       final result = await WeatherRepasitory.getData(cityName);
       model = result;
       status = WeatherStatus.success;
       notifyListeners();
    } catch (e) {
      print("error message $e");
      status =WeatherStatus.error;
    }
  }
}
enum WeatherStatus {loading, error , success}