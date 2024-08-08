import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/fonts/font_style.dart';

class CustomWeatherMenuWidget extends StatelessWidget {
  const CustomWeatherMenuWidget( {
    super.key,
    required this.time,
    required this.aq,
    required this.uv,
    required this.humudity,
  });
  final String time;
  final num aq;
  final num uv;
  final num humudity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Time".toUpperCase(),
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textGrey, fontWeight: FontWeight.w500),
              ),
              Text(
                "${DateFormat('hh:mm a').format(DateTime.parse(time))} ",
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textNormal, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Uv".toUpperCase(),
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textGrey, fontWeight: FontWeight.w500),
              ),
              Text(
                uv.toString().toUpperCase(),
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textNormal, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "%Rain".toUpperCase(),
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textGrey, fontWeight: FontWeight.w500),
              ),
              Text(
                "$humudity%".toUpperCase(),
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textNormal, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "AQ".toUpperCase(),
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textGrey, fontWeight: FontWeight.w500),
              ),
              Text(
                aq.toString().toUpperCase(),
                style: FontStyleConst.medium.copyWith(
                    color: ColorConst.textNormal, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
