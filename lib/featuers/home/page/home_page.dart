import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/icons/icon_const.dart';
import 'package:weather_app/core/utils/location_service.dart';
import 'package:weather_app/core/utils/main_provider.dart';
import 'package:weather_app/core/widgets/custom_main_widget.dart';
import 'package:weather_app/core/widgets/weather_widget.dart';
import 'package:weather_app/featuers/search/page/search_screen.dart';
import 'package:weather_app/featuers/search/widgets/textfield_widget.dart';

import '../../../core/widgets/weather_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController tabController;

  get builder => null;
  @override
  void initState() {
    super.initState();
    tabController = PageController(
      initialPage: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      final data = context.watch<MainProvider>().model;
      final status = context.watch<MainProvider>().status;
      if (status == WeatherStatus.loading) {
        return Center(
          child: CircularProgressIndicator(
            color: ColorConst.green,
          ),
        );
      }
      if (status == WeatherStatus.success) {
        return SafeArea(
            child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 17),
                    child: CustomTextField(
                      read: true,
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SearchScreen(),
                          )),
                      onChanged: (value) {},
                    ),
                  ),
                  Center(
                    child: Transform.scale(
                      scale: 0.6,
                      child: SmoothPageIndicator(
                          effect: const WormEffect(),
                          controller: tabController,
                          count: 3),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                        controller: tabController,
                        itemBuilder: (context, index) {
                          return ListView(
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
                                  cityName: data!.location.name,
                                  weatherIcon: IconConst.sun,
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              CustomWeatherMenuWidget(
                                time: context
                                    .watch<MainProvider>()
                                    .model!
                                    .location
                                    .localtime,
                                aq: context
                                    .watch<MainProvider>()
                                    .model!
                                    .current
                                    .isDay,
                                humudity: context
                                    .watch<MainProvider>()
                                    .model!
                                    .current
                                    .humidity,
                                uv: context
                                    .watch<MainProvider>()
                                    .model!
                                    .current
                                    .uv,
                              ),
                              const SizedBox(
                                height: 21,
                              ),
                              const CustomMainWidget(),
                              const SizedBox(
                                height: 47,
                              ),
                              Center(
                                  child: Text(
                                "Delete Location",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: ColorConst.textRed,
                                        fontWeight: FontWeight.w700),
                              )),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ]));
      }
      return const SizedBox();
    }));
  }
}
