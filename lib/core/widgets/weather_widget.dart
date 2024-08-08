import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:weather_app/core/constants/fonts/font_style.dart';
import 'package:weather_app/core/constants/icons/icon_const.dart';

class CustomWeatherWidget extends StatelessWidget {
  const CustomWeatherWidget({
    super.key, required this.gradus, required this.cityName, required this.weatherIcon,
  });
final num gradus;
final String cityName;
final String weatherIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 205,
      height: 300,
      child: Column(
        children: [
          SizedBox(
            width: 123,
            height: 107,
            child: SvgPicture.asset(weatherIcon,)),
          const SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cityName.toUpperCase(),style: FontStyleConst.big.copyWith(fontWeight: FontWeight.w900)),
              SvgPicture.asset(IconConst.vector)
            ],
          ),
             const SizedBox(height: 16,),
          Stack(
            children: [
              Text("$gradus ",style: FontStyleConst.huge.copyWith(fontWeight: FontWeight.w600),),
              Positioned(
                right: 0,
                child: Text("○",style: FontStyleConst.big.copyWith(fontWeight: FontWeight.w600,fontSize: 25),)),
            ],
          ),                          
          ],
      ),
    );
  }
}
