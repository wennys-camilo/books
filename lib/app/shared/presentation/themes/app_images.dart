abstract class AppImages {
  String get background;
  String get logo;
  String get backgroundFull;
}

class AppImagesImpl implements AppImages {
  @override
  String get background => 'assets/images/background.png';

  @override
  String get backgroundFull => 'assets/images/background_full.png';

  @override
  String get logo => 'assets/images/logo.svg';
}
