class ItemModel {
  ItemModel({
    required this.region,
    this.widthForFirstCircle = 35,
    this.widthForSecondCircle = 36,
    this.inputIcon = 'assets/images/phone.svg',
    this.number = '+1 (201) 123 45 67',
    this.textInFirstCircle = 'S',
    this.textInSecondCircle = 'V',
    this.heightForCircle = 36,
  });

  final String inputIcon;
  final String number;
  final String region;
  final String textInFirstCircle;
  final String textInSecondCircle;
  final double heightForCircle;
  final double widthForFirstCircle;
  final double widthForSecondCircle;
}
