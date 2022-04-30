abstract class AppImages {
  String get background;
  String get logo;
}

class AppImagesImpl implements AppImages {
  @override
  String get background => 'assets/images/background.png';

  @override
  String get logo => 'assets/images/logo.svg';
}
