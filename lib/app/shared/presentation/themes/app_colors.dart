import 'package:flutter/material.dart';

abstract class AppColors {
  Color get blackLight;
  Color get pink;
  Color get grey;
  Color get greyDark;
}

class AppColorsImpl implements AppColors {
  @override
  Color get blackLight => const Color.fromRGBO(0, 0, 0, 0.32);
  @override
  Color get pink => const Color(0xffB22E6F);
  @override
  Color get grey => Colors.black.withOpacity(0.2);

  @override
  Color get greyDark => const Color(0xff999999);
}
