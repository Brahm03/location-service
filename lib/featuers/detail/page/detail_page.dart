import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/fonts/font_style.dart';
import 'package:weather_app/core/constants/icons/icon_const.dart';
import 'package:weather_app/core/utils/check_color.dart';
import 'package:weather_app/core/widgets/custom_main_widget.dart';
import 'package:weather_app/core/widgets/weather_menu_widget.dart';
import 'package:weather_app/core/widgets/weather_widget.dart';

class DetailPage extends StatefulWidget {
   DetailPage({super.key, this.addList = false});
  bool? addList ;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
       automaticallyImplyLeading: true,
       actions: [
        GestureDetector(
          onTap: (){
            setState(() {
              widget.addList = true;
            });
          },
          child: Container(
            width: 110,
            margin: EdgeInsets.only(right: 24),
            alignment: Alignment.centerRight,
            height: 40,
            decoration: BoxDecoration(
              color: widget.addList == true ?ColorConst.green:Colors.transparent,
              borderRadius: BorderRadius.circular(7)
            ),
            child:widget.addList == true? Row(
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text("Added to list  ",style: FontStyleConst.medium.copyWith(fontSize: 12, fontWeight: FontWeight.w700,),),
              ),
              SvgPicture.asset(IconConst.tick)
            ],)
           : Row(
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text("Add to list  ",style: FontStyleConst.medium.copyWith(fontSize: 12, fontWeight: FontWeight.w700),),
              ),
              SvgPicture.asset(IconConst.plus,colorFilter: ColorFilter.mode(checkModeGiveColor(mode: MediaQuery.of(context).platformBrightness, light: ColorConst.black, dark: ColorConst.white), BlendMode.srcIn),)
            ],),
          
          ),
        )
       ],
      ),
        body: SafeArea(
            child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
          Column(
            children: [
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 41,
                  ),
                  SizedBox(
                    width: 205,
                    child: CustomWeatherWidget(
                      gradus: 31,
                      cityName: "Tashkent",
                      weatherIcon: IconConst.sun,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomWeatherMenuWidget(
                    time: DateTime.now().toString(),
                    aq: 22,
                    humudity: 25,
                    uv: 3,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const CustomMainWidget(),
                  const SizedBox(
                    height: 47,
                  ),
                ],
              )
            ],
          ),
        ])));
  }
}
