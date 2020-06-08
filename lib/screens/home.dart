// Copyright 2020 Appliberated. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_color_generator/common/app_strings.dart';
import 'package:random_color_generator/models/random_color.dart';
import 'package:random_color_generator/utils/utils.dart';
import 'package:random_color_generator/widgets/app_drawer.dart';

/// Overflow menu items enumeration.
enum MenuAction { reset, share }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The AppBar's action needs this key to find its own Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Random _random = Random();

  ColorType _currentColorType;

  set currentColorType(ColorType value) {
    setState(() {
      _currentColorType = value;
      _randomColorGenerator = _randomColorGenerators[_currentColorType];
    });
  }

  RandomColor _randomColorGenerator;

  Map<ColorType, RandomColor> _randomColorGenerators;

  @override
  void initState() {
    super.initState();

    _randomColorGenerators = {
//      ColorType.basic: BasicColorGenerator(_random),
      ColorType.css: RandomCSSColor(_random),
//      ColorType.material: MaterialColorGenerator(_random),
    };

//    currentColorType = ColorType.basic;
    currentColorType = ColorType.css;

    _loadCounters();
  }

  /// Loads counter values from persistent storage.
  Future<void> _loadCounters() async {
//    await _counters.load();
//    await _appSettings.load();
    setState(() {
      /* Refresh after loading counters. */
    });
  }

  /// Performs the tasks of the popup menu items (reset, share, rate, and help).
  void popupMenuSelection(MenuAction item) {
    switch (item) {
      case MenuAction.reset:
        break;
      case MenuAction.share:
      // Share the current counter value using the platform's share sheet.
//        final String name = _counters.current.name;
//        final String value = toDecimalString(context, _counters.current.value);
//        Share.share(AppStrings.shareText(name, value), subject: name);
//        break;
    }
  }

  void drawerMainSelection(ColorType type) {
    currentColorType = type;
  }

  void drawerExtraSelection(DrawerExtraActions item) {
    switch (item) {
      case DrawerExtraActions.settings:
        // Load the Settings screen
        _loadSettingsScreen();
        break;
      case DrawerExtraActions.help:
        // Launch the app online help url
        launchUrl(_scaffoldKey.currentState, AppStrings.helpURL);
        break;
      case DrawerExtraActions.rate:
        // Launch the Google Play Store page to allow the user to rate the app
        launchUrl(_scaffoldKey.currentState, AppStrings.rateAppURL);
        break;
    }
  }

  /// Navigates to the Settings screen, and refreshes on return.
  Future<void> _loadSettingsScreen() async {
//    await Navigator.push<void>(context,
//        MaterialPageRoute(builder: (context) => SettingsScreen(appSettings: _appSettings)));
    setState(() {
      /* Refresh after returning from Settings screen. */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: Container(
        color: _randomColorGenerator.color,
        alignment: Alignment.center,
        child: Text('Hello'),
      ),
//      body: CounterDisplay(
//        value: _counters.current.value,
//        color: _counters.current.color,
//        isPortrait: isPortrait,
//      ),
      floatingActionButton: _buildFAB(),
    );
  }

  /// Builds the app bar with the popup menu items.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
//      title: Text(_randomColorGenerator.runtimeType.toString()),
      title: Text(_randomColorGenerator.title),
      actions: <Widget>[
        PopupMenuButton<MenuAction>(
          onSelected: popupMenuSelection,
          itemBuilder: _buildMenuItems,
        ),
      ],
    );
  }

  /// Builds the popup menu items for the app bar.
  List<PopupMenuItem<MenuAction>> _buildMenuItems(BuildContext context) {
    return MenuAction.values
        .map(
          (item) => PopupMenuItem<MenuAction>(
            value: item,
            child: Text(AppStrings.menuActions[item]),
          ),
        )
        .toList();
  }

  /// Builds the main drawer that lets the user switch between color counters.
  Widget _buildDrawer() {
    return AppDrawer(
      title: AppStrings.drawerTitle,
      onSelected: drawerMainSelection,
      onExtraSelected: drawerExtraSelection,
      selectedType: null,
    );
  }

  /// Builds the two main floating action buttons for increment and decrement.
  Widget _buildFAB() {
    return FloatingActionButton(
      child: const Icon(Icons.refresh),
//      tooltip: AppStrings.decrementTooltip,
//      onPressed: () => setState(() => _counters.current.decrement()),
      onPressed: () => setState(() => _randomColorGenerator.randomize()),
    );
  }
}
