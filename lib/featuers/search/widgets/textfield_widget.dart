import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_app/core/constants/colors/color_const.dart';
import 'package:weather_app/core/constants/icons/icon_const.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField(
      {super.key,
      this.hinText,
      this.onTap,
      this.read = false, 
      required  Function(dynamic value) onChanged, 
     this.controller,
       });

  final String? hinText;
  final VoidCallback? onTap;
  final TextEditingController ? controller;
  bool read;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: read,
      style: Theme.of(context).textTheme.headlineMedium,
      decoration: InputDecoration(
        fillColor: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? ColorConst.black
            : ColorConst.darkGrey,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: GestureDetector(
          onTap:(){
            read = false;
            },
          child: Padding(padding: EdgeInsets.all(14), child:SvgPicture.asset(IconConst.search) )),
        hintText: 'Search location',
      ),
      keyboardType: TextInputType.text,
    );
  }
}
