import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/icons/icon_const.dart';
import 'package:weather_app/core/utils/main_provider.dart';
import 'package:weather_app/featuers/search/widgets/search_cart_city.dart';
import 'package:weather_app/featuers/search/widgets/search_last_saved.dart';
import 'package:weather_app/featuers/search/widgets/textfield_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
TextEditingController _searchController = TextEditingController();
 

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,top: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
               controller: _searchController, 
                 onChanged: (value) {  },),
            const Wrap(
              children: [
                Search_last_saved(
                  searchedCity: 'Mumbai',
                ),
              ],
            ),
             ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
               itemBuilder: (context,index) {
            final status = context.watch<MainProvider>().status;
            if (status == WeatherStatus.loading) {
            return  Center(
              child: CircularProgressIndicator(
                color: ColorConst.green,
              ),
            );
            }
            if(status == WeatherStatus.success){
                 return SearchCity(city: context.watch<MainProvider>().model!.location.name, temperature: context.watch<MainProvider>().model!.current.tempC.toString(), icon: IconConst.rain,isWarning: true );

            }
            return SizedBox();
               }
             )
          ],
        ),
      ),
    )

        // ),
        );
  }
}
