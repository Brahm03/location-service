import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';

import 'package:weather_app/core/utils/check_color.dart';

class Search_last_saved extends StatelessWidget {
  const Search_last_saved({
    super.key,
    required this.searchedCity,
  });

  final String searchedCity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: checkModeGiveColor(
          mode: MediaQuery.of(context).platformBrightness,
          light: ColorConst.darkGrey,
          dark: ColorConst.black,
        ),
      ),
      child: Text(
        searchedCity,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
