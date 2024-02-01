part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.init() = _Init;

  const factory HomeScreenEvent.pressedOnUpMenu(UpMenu menu) = _PressedOnUpMenu;

  const factory HomeScreenEvent.pressedOnBottomMenu(BottomMenu menu) = _PressedOnBottomMenu;

  const factory HomeScreenEvent.pressedOnItemInDropDown(String text) = _PressedOnItemInDropDown;
}
