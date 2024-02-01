class BottomMenu {
  BottomMenu({required this.iconPath, required this.text, this.isSelected = false, this.isVertical = true});
  final String iconPath;
  final String text;
  bool isSelected;
  bool isVertical;
}