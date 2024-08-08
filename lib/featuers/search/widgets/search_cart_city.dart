import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/fonts/font_style.dart';
import 'package:weather_app/core/constants/icons/icon_const.dart';
import 'package:weather_app/core/utils/check_color.dart';
import 'package:weather_app/featuers/detail/page/detail_page.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({
    super.key,
    required this.city,
    
    required this.temperature, required this.icon, this.isWarning = false,
  });
  final String city;
  final String icon;
  final String temperature;
 final bool isWarning;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>DetailPage()));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all( 24),
        decoration: BoxDecoration(
            border: Border.all(
                color: checkModeGiveColor(
                    mode: MediaQuery.of(context).platformBrightness,
                    light: Colors.transparent,
                    dark: ColorConst.grey)),
            color: checkModeGiveColor(
              mode: MediaQuery.of(context).platformBrightness,
              light: ColorConst.darkGrey,
              dark: ColorConst.black,
            ),
            borderRadius: BorderRadius.circular(11)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(city,
                  style: FontStyleConst.medium
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 13,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(temperature,
                                style: FontStyleConst.big.copyWith(
                                    fontSize: 60, fontWeight: FontWeight.bold)),
                            Text(
                              '°',
                              style: FontStyleConst.medium.copyWith(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                        children: [
                                                 SizedBox(
                              width: 106,
                              height: 80,
                           child:  SvgPicture.asset(icon),
                              
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                      
                        ]),
                  ]),
                isWarning == true?Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconConst.warning,colorFilter: ColorFilter.mode(ColorConst.yellow, BlendMode.srcIn)),
                            Text(
                              'WARNING',
                              style: FontStyleConst.medium.copyWith(
                                  color: ColorConst.yellow, fontSize: 12),
                            ),
                            Spacer(),
                                Text(
                            'Expecting Rainfall',
                            style: FontStyleConst.medium
                                .copyWith(color: ColorConst.yellow, fontSize: 12),
                          )
                          
                          ],
                        ):SizedBox()               
            ]),
      
      ),
    );
  }
}
