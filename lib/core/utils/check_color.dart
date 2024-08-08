import 'package:flutter/cupertino.dart';

checkModeGiveColor(
    {required Brightness mode, required Color light, required Color dark}) {
  if (mode == Brightness.dark) {
    return dark;
  } else {
    return light;
  }
}
