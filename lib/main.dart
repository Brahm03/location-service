import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/constants/theme/app_theme.dart';
import 'package:weather_app/core/utils/location_service.dart';
import 'package:weather_app/core/utils/main_provider.dart';
import 'package:weather_app/featuers/home/page/home_page.dart';
import 'package:weather_app/featuers/search/provider/search_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainProvider()),
    ChangeNotifierProvider(create: (_) => WeatherProvider()),
  ], child: const MyWeatherApp()));
}

class MyWeatherApp extends StatefulWidget {
  const MyWeatherApp({super.key});

  @override
  State<MyWeatherApp> createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocationService.getCurrentUserLocation().then((value) {
      // ignore: use_build_context_synchronously
      Provider.of<MainProvider>(context, listen: false).getWeather('Tashkent');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Weather',
      debugShowCheckedModeBanner: false,
      theme: light,
      darkTheme: dark,
      home: const HomePage(),
    );
  }
}
