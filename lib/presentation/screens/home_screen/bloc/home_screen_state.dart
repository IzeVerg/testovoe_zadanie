part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState{
  factory HomeScreenState({
    @Default('+12021234567') String phoneTitle,
    @Default('assets/images/usa_flag.png') String flagPath,
    @Default('United States') String country,
    @Default('+1 (201) 123 45 67') String editedPhone,
    @Default([])List<String> textForDropDown,
    String? currentTextForDropDown,
    @Default([])List<ItemModel> listOfItemModel,
    @Default([])List<BottomMenu> listOfBottomMenu,
    BottomMenu? currentOfBottomMenu,
    @Default([])List<UpMenu> listOfUpMenu,
    UpMenu? currentOfUpMenu,
    @Default(false) bool isLoading,
  }) = _HomeScreenState;
}
