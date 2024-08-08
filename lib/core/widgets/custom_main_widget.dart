import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/fonts/font_style.dart';
import 'package:weather_app/core/constants/icons/icon_const.dart';
import 'package:weather_app/core/utils/check_color.dart';

class CustomMainWidget extends StatelessWidget {
  const CustomMainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SUNRISE & SUNSET".toUpperCase(),
            style: FontStyleConst.medium.copyWith(
                color: ColorConst.textGrey, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 99,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                      width: 331,
                      height: 85,
                      child: SvgPicture.asset(
                        IconConst.sunRiseSet,
                        fit: BoxFit.fitWidth,
                      )),
                ),
                Positioned(
                  left: 33,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Sunrise".toUpperCase(),
                            style: FontStyleConst.small
                                .copyWith(color: ColorConst.textGrey),
                          ),
                          Text(
                            "08:30 PM".toUpperCase(),
                            style: FontStyleConst.small.copyWith(
                                color: ColorConst.textNormal, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 157,
                      ),
                      Column(
                        children: [
                          Text(
                            "SUNSET".toUpperCase(),
                            style: FontStyleConst.small
                                .copyWith(color: ColorConst.textGrey),
                          ),
                          Text(
                            "06:25 AM".toUpperCase(),
                            style: FontStyleConst.small.copyWith(
                                color: ColorConst.textNormal, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 112,
                  top: 18,
                  child: SizedBox(
                    width: 15,
                    height: 13.5,
                    child: SvgPicture.asset(IconConst.sun),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 31),
            child: Row(
              children: [
                Text("Length of day: ".toUpperCase(),
                    style: FontStyleConst.small.copyWith(
                      color: ColorConst.textGrey,
                    )),
                Text("13H 12M".toUpperCase(),
                    style: FontStyleConst.small.copyWith(
                      color:checkModeGiveColor(mode: MediaQuery.of(context).platformBrightness, light: ColorConst.textBlack, dark: ColorConst.white)    
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Text("Remaining daylight: ".toUpperCase(),
                    style: FontStyleConst.small.copyWith(
                      color: ColorConst.textGrey,
                    )),
                Text("9H 22M".toUpperCase(),
                    style: FontStyleConst.small.copyWith(
                      color: checkModeGiveColor(mode: MediaQuery.of(context).platformBrightness, light: ColorConst.textBlack, dark: ColorConst.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
