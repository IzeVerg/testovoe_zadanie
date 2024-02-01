import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/domain/dto/bottom_menu.dart';
import 'package:test_project/domain/dto/item_model.dart';
import 'package:test_project/domain/dto/up_menu.dart';

part 'home_screen_bloc.freezed.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState()) {
    on<_Init>(_init);
    on<_PressedOnUpMenu>(_pressedOnUpMenu);
    on<_PressedOnBottomMenu>(_pressedOnBottomMenu);
    on<_PressedOnItemInDropDown>(_pressedOnItemInDropDown);
    add(const HomeScreenEvent.init());
  }

  FutureOr<void> _init(_Init event,
      Emitter<HomeScreenState> emit,) {
    List<BottomMenu> listOfBottomMenu = [
      BottomMenu(iconPath: 'assets/images/home.svg', text: 'Home', isSelected: true, isVertical: false),
      BottomMenu(iconPath: 'assets/images/phone.svg', text: 'Calls'),
      BottomMenu(iconPath: 'assets/images/chat_2.svg', text: 'Messages'),
      BottomMenu(iconPath: 'assets/images/contacts.svg', text: 'Contacts'),
    ];

    BottomMenu currentOfBottomMenu = listOfBottomMenu.firstWhere((element) => element.isSelected == true);

    List<UpMenu> listOfUpMenu = [
      UpMenu(title: 'SMS'),
      UpMenu(title: 'MMS', isSelected: true),
      UpMenu(title: 'Voice'),
    ];

    UpMenu currentOfUpMenu = listOfUpMenu.firstWhere((element) => element.isSelected == true);

    List<String> textForDrop = [
      'Landline or Mobile',
      'Mobile or Landline',
      'Flutter or Web',
      'Ios or Android',
      '111 or 222',
      '145 or 9003',
    ];

    List<ItemModel> models = [
      ItemModel(region: 'New Jersey'),
      ItemModel(region: 'Washington'),
      ItemModel(region: 'New Jersey'),
    ];

    emit(
      state.copyWith(
        currentTextForDropDown: textForDrop.first,
        currentOfBottomMenu: currentOfBottomMenu,
        currentOfUpMenu: currentOfUpMenu,
        textForDropDown: textForDrop,
        listOfUpMenu: listOfUpMenu,
        listOfBottomMenu: listOfBottomMenu,
        listOfItemModel: models,
      ),
    );
    emit(
      state.copyWith(isLoading: false),
    );
  }

  FutureOr<void> _pressedOnUpMenu(_PressedOnUpMenu event,
      Emitter<HomeScreenState> emit,) {
    UpMenu currentMenu = state.listOfUpMenu.firstWhere((element) => element.isSelected == true);
    for (int index = 0; index < state.listOfUpMenu.length; index++) {
      if (state.listOfUpMenu[index] == currentMenu) {
        state.listOfUpMenu[index].isSelected = false;
      }
      if (event.menu == state.listOfUpMenu[index]) {
        state.listOfUpMenu[index].isSelected = true;
        emit(state.copyWith(currentOfUpMenu: state.listOfUpMenu[index]));
      }
    }
  }

  FutureOr<void> _pressedOnBottomMenu(_PressedOnBottomMenu event,
      Emitter<HomeScreenState> emit,) {
    BottomMenu currentMenu = state.listOfBottomMenu.firstWhere((element) => element.isSelected == true);
    for (int index = 0; index < state.listOfBottomMenu.length; index++) {
      if (state.listOfBottomMenu[index] == currentMenu) {
        state.listOfBottomMenu[index].isSelected = false;
      }
      if (event.menu == state.listOfBottomMenu[index]) {
        state.listOfBottomMenu[index].isSelected = true;
        emit(state.copyWith(currentOfBottomMenu: state.listOfBottomMenu[index]));
      }
    }
  }

  FutureOr<void> _pressedOnItemInDropDown(_PressedOnItemInDropDown event,
      Emitter<HomeScreenState> emit,) {
    for (int index = 0; index < state.textForDropDown.length; index++) {
      if (state.textForDropDown[index] == event.text) {
        emit(state.copyWith(currentTextForDropDown: state.textForDropDown[index]));
      }
    }
  }
}
