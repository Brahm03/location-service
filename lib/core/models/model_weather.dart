import 'package:hive/hive.dart';

part 'model_weather.g.dart';

@HiveType(typeId: 0)
class Weather {
@HiveField(0)
  final String cityName;

  @HiveField(1)
  final  String temperature;

  @HiveField(2)
  final String condition;

  @HiveField(3)
  final String iconUrl;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
  });
}
