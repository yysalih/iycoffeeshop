import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/languages.dart';
import 'package:iycoffee/views/card_views/card_view.dart';
import 'package:iycoffee/views/profile_views/profile_view.dart';
import 'package:iycoffee/views/shop_views/shop_view.dart';
import '../models/user_model.dart';

class MainState {
  final int bottomIndex;
  final String selectedTab;
  final UserModel currentUser;

  final String searchString;
  final List filteredItems;
  final bool itemsOpened;

  MainState({
    required this.bottomIndex,
    required this.selectedTab,
    required this.currentUser,
    required this.searchString,
    required this.filteredItems,
    required this.itemsOpened,
  });

  MainState copyWith({
    int? bottomIndex,
    String? selectedTab,
    String? searchString,
    UserModel? currentUser,
    List? filteredItems,
    bool? itemsOpened,
  }) {
    return MainState(
      bottomIndex: bottomIndex ?? this.bottomIndex,
      selectedTab: selectedTab ?? this.selectedTab,
      currentUser: currentUser ?? this.currentUser,
      searchString: searchString ?? this.searchString,
      filteredItems: filteredItems ?? this.filteredItems,
      itemsOpened: itemsOpened ?? this.itemsOpened,
    );
  }
}

class MainController extends StateNotifier<MainState> {
  MainController(super.state);


  final searchController = TextEditingController();

  final List<Widget> pages = [
    ShopView(), CardView(), ProfileView()
  ];

  List<Map<String, dynamic>> pageInfo(String language) => [
    {
      "label": languages[language]!["shop_view"],
      "icon": Icons.coffee
    },
    {
      "label": languages[language]!["card_view"],
      "icon": Icons.shopping_cart_rounded
    },
    {
      "label": languages[language]!["profile_view"],
      "icon": Icons.person
    },
  ];

  changePage(int index) {
    state = state.copyWith(
        bottomIndex: index,);
  }


  changeSearchString({required String value}) =>
      state = state.copyWith(searchString: value);

  showSearchItems({required bool value}) =>
      state = state.copyWith(itemsOpened: value);

  updateFilteredList(List list) => state = state.copyWith(filteredItems: list);


}

final mainController = StateNotifierProvider<MainController, MainState>(
  (ref) => MainController(
    MainState(
        bottomIndex: 0,
        selectedTab: "",
        currentUser: UserModel(),
        searchString: "",
        filteredItems: [],
        itemsOpened: false,
    ),
  ),
);
