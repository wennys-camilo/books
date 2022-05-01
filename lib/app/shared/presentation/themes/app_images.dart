abstract class AppImages {
  String get background;
  String get logo;
  String get backgroundFull;
  String get homeBackground;
  String get searchIcon;
  String get bookPlaceholder;
  String get quotion;
}

class AppImagesImpl implements AppImages {
  @override
  String get background => 'assets/images/background.png';

  @override
  String get backgroundFull => 'assets/images/background_full.png';

  @override
  String get logo => 'assets/images/logo.svg';

  @override
  String get homeBackground => 'assets/images/home_background.png';

  @override
  String get searchIcon => 'assets/images/search_icon.svg';

  @override
  String get bookPlaceholder => 'assets/images/book_placeholder.svg';

  @override
  String get quotion => 'assets/images/quotion.svg';
}
