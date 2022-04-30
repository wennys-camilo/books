import 'package:flutter/cupertino.dart';

abstract class AppColors {
  Color get blackLight;
  Color get pink;
}

class AppColorsImpl implements AppColors {
  @override
  Color get blackLight => const Color.fromRGBO(0, 0, 0, 0.32);
  @override
  Color get pink => const Color(0xffB22E6F);
}
